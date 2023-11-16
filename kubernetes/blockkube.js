const fs = require('fs');
const ejs = require('ejs');
const yaml = require('js-yaml');

// Load environment configuration
const config = yaml.load(fs.readFileSync('environment.yaml', 'utf8'));

// Function to render an EJS template
function renderTemplate(templateFile, data) {
    const template = fs.readFileSync(`ejs/${templateFile}`, 'utf8');
    return ejs.render(template, data);
}

// Function to set node template variables
function setNodeTemplateVars(node) {
    const nodeKey = Object.keys(node)[0]; // Get the key of the node (e.g., 'miner01')
    const nodeData = node[nodeKey];       // Access the node's data using the key
    return {
        ...nodeData.geth,                 // Spread the 'geth' properties
        ...nodeData.k8s,                  // Spread the 'k8s' properties if they exist
        Node_UserIdent: nodeKey           // Include the node's identifier
    };
}

function setBootNodeTemplateVars(node) {
    const nodeKey = Object.keys(node)[0];
    const nodeData = node[nodeKey];
    return {
        ...nodeData.geth,
        ...nodeData.k8s,
    };
}

// Generate genesis.json
const genesisContent = renderTemplate('genesis.json.ejs', { config: config });
fs.writeFileSync('genesis.json', genesisContent);

config.bootnodes.forEach((bootnode, index) => {
    const bootnodeVars = setNodeTemplateVars(bootnode);
    const bootnodeTomlContent = renderTemplate('node.toml.ejs', {
        ...bootnodeVars,
        config: config
    });
    // This will overwrite bootnode.toml for each bootnode in the loop
    fs.writeFileSync(`bootnode.toml`, bootnodeTomlContent);
});



// Generate node TOML files for nodes
config.nodes.forEach(node => {
    const nodeVars = setNodeTemplateVars(node);
    // Pass both nodeVars and config to the template
    const nodeTomlContent = renderTemplate('node.toml.ejs', {
        ...nodeVars, // spread the nodeVars to pass all its properties
        config: config // pass the entire config object
    });
    fs.writeFileSync(`${nodeVars.Node_UserIdent}.toml`, nodeTomlContent);
});

// Generate YAML files
const claimsContent = renderTemplate('00_claims.yaml.ejs', {
    nodes: config.nodes.map(setNodeTemplateVars),
    bootnodes: config.bootnodes.map(setBootNodeTemplateVars),
    config: config
});
fs.writeFileSync('yaml/00_claims.yaml', claimsContent);


const commonConfigContent = renderTemplate('01_common-config.yaml.ejs',{
        config: config,
        genesisContent
});

fs.writeFileSync('yaml/01_common-config.yaml', commonConfigContent);

const bootnodeFileContents = config.bootnodes.map(bootnode => {
    const bootnodeKey = Object.keys(bootnode)[0];
    const bootnodeData = bootnode[bootnodeKey];

    // Read keystore file content
    const keystoreFilename = config.keystore.items[bootnodeData.geth.Eth_Etherbase];
    const keystoreFileContent = fs.readFileSync(`keystore/${keystoreFilename}`, 'utf-8');

    // Read TOML file content
    const tomlFilename = `${bootnodeData.geth.Node_UserIdent}.toml`;
    const tomlFileContent = fs.readFileSync(tomlFilename, 'utf-8');

    return {
        ...bootnodeData,
        keystoreFilename,
        keystoreFileContent: keystoreFileContent,
        tomlFileContent: tomlFileContent
    };
});

const bootnodesContent = renderTemplate('02_bootnodes.yaml.ejs', {
    bootnodes: bootnodeFileContents,
    config: config
});
fs.writeFileSync('yaml/02_bootnodes.yaml', bootnodesContent);

const nodesFileContents = config.nodes.map(node => {
    const nodeKey = Object.keys(node)[0];
    const nodeData = node[nodeKey];

    // Read keystore file content
    const keystoreFilename = config.keystore.items[nodeData.geth.Eth_Etherbase];
    const keystoreFileContent = fs.readFileSync(`keystore/${keystoreFilename}`, 'utf-8');

    // Read TOML file content
    const tomlFilename = `${nodeData.geth.Node_UserIdent}.toml`;
    const tomlFileContent = fs.readFileSync(tomlFilename, 'utf-8');

    return {
        ...nodeData,
        keystoreFilename,
        keystoreFileContent: keystoreFileContent,
        tomlFileContent: tomlFileContent
    };
});

const nodesConfigContent = renderTemplate('03_nodes.yaml.ejs', { 
    nodes: nodesFileContents,
    config: config
});
fs.writeFileSync('yaml/03_nodes.yaml', nodesConfigContent);

const monitorConfigContent = renderTemplate('04_monitor.yaml.ejs', { 
    nodes: config.nodes.map(setNodeTemplateVars),
    config: config 
});
fs.writeFileSync('yaml/04_monitor.yaml', monitorConfigContent);

const explorerConfigContent = renderTemplate('05_explorer.yaml.ejs', { config: config });
fs.writeFileSync('yaml/05_explorer.yaml', explorerConfigContent);

const backendConfigContent = renderTemplate('06_backend.yaml.ejs', { config: config });
fs.writeFileSync('yaml/06_backend.yaml', backendConfigContent);

const loadBalancersContent = renderTemplate('07_load_balancers.yaml.ejs', { config: config });
fs.writeFileSync('yaml/07_load_balancers.yaml', loadBalancersContent);
