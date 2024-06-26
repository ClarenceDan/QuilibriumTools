# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n 2> /dev/null || true

# Shortcuts for General Management
alias e="exit"
alias cm="ps -eo comm,pcpu --sort -pcpu | head -8; ps -eo comm,pmem --sort -pmem | head -8"
alias st='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3'
alias myip='curl icanhazip.com'
alias wttr='curl wttr.in'

neofetch

# Get system information
ARCH=$(uname -m)
OS=$(uname -s)

# Determine the node binary name based on the architecture and OS
if [ "$ARCH" = "x86_64" ]; then
    if [ "$OS" = "Linux" ]; then
        NODE_BINARY='node-1.4.18-linux-amd64'
    elif [ "$OS" = "Darwin" ]; then
        NODE_BINARY='node-1.4.18-darwin-amd64'
    fi
elif [ "$ARCH" = "aarch64" ]; then
    if [ "$OS" = "Linux" ]; then
        NODE_BINARY='node-1.4.18-linux-arm64'
    elif [ "$OS" = "Darwin" ]; then
        NODE_BINARY='node-1.4.18-darwin-arm64'
    fi
fi


# Shortcuts for Docker
alias dpeer-count='cd ~/ceremonyclient/ && docker compose exec node grpcurl -plaintext -max-msg-sz 150000000 localhost:8337 quilibrium.node.node.pb.NodeService.GetPeerManifests | grep peerId | wc -l'
alias dnode-info='cd ~/ceremonyclient/ && docker compose exec node node -node-info && cd ~'
alias ddb-console='cd ~/ceremonyclient/ && - docker compose exec node node --db-console && cd ~'
alias dbalance='cd ~/ceremonyclient/ && docker compose exec node node -balance && cd ~'
alias dlog='cd ~/ceremonyclient/ && docker compose logs -f -n, --tail 100 && cd ~'
alias dstart='cd ~/ceremonyclient/ && docker compose up -d && cd ~'
alias drestart='cd ~/ceremonyclient/ && docker compose down && docker compose up -d && cd ~'
alias dstop='cd ~/ceremonyclient/ && docker compose down && cd ~'
# Shortcuts for Service
alias peer-count='cd ~/ceremonyclient/node && grpcurl -plaintext -max-msg-sz 150000000 localhost:8337 quilibrium.node.node.pb.NodeService.GetPeerManifests | grep peerId | wc -l && cd ~'
alias node-info='cd ~/ceremonyclient/node && ./${NODE_BINARY} -node-info && cd ~'
alias db-console='cd ~/ceremonyclient/node && ./${NODE_BINARY} --db-console && cd ~'
alias balance='cd ~/ceremonyclient/node && ./${NODE_BINARY} -balance && cd ~'
alias nlog='sudo journalctl -u ceremonyclient.service -f --no-hostname -o cat'
alias nstart='service ceremonyclient start'
alias nrestart='service ceremonyclient restart'
alias nstop='service ceremonyclient stop'