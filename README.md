# Automation scripts for various tasks Terra Classic related

**setenv** - sets up a commannd-line go development environment and can be used to quickly switch between multiple different repos.
    Syntax: . setenv <repo-name>
  
**addkeys.sh** - automates the invokation of terrad keys add to initialise validator credentials from a node-name and passphrase.
  
**reckeys.sh** - automates the invokation of terrad keys add --recover to restore validator credentials from an existing node-name, seed/mnemonic, and passphrase
