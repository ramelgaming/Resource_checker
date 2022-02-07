description 'Resource Checker (AntiResource-Stop)'

client_script {
    'config.lua',
    'client.lua',
}

server_script {
    'config.lua',
    'server.lua',
}

client_script "@Resource_checker/client.lua"
