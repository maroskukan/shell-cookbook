
# Description: Port scaner, inspiration from catonmat

# Loading function
# . ../functions/nettools.sh
# type scan
# scan is a shell function from ../functions/nettools.sh
# 
# Unloading function
# unset -f scan 

scan() {
  if [[ -z $1 || -z $2 || -z $3 ]]; then
    echo "Usage: $0 [tcp | udp] <host> <port, ports, or port-range>"
    echo "Example: $0 tcp google.com 80,443"
    return
  fi
  local proto=$1
  local host=$2
  local ports=()
  case $3 in
    *-*)
      IFS=- read start end <<< "$3"
      for ((port=start; port <= end; port++)); do
        ports+=($port)
      done
      ;;
    *,*)
      IFS=, read -ra ports <<< "$3"
      ;;
    *)
      ports+=($3)
      ;;
  esac

  for port in "${ports[@]}"; do
    timeout 1 bash -c "echo >/dev/$proto/$host/$port" &&
      echo "port ${proto}/$port is open" ||
      echo "port ${proto}/$port is closed"
  done
}
