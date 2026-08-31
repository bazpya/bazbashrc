# list containers nicely formatted
alias dlsc="docker container ls -a --format 'table{{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}'"
# delete all containers
alias drmc="docker ps -qa | xargs -r docker rm -vf"

# list images nicely formatted
alias dlsi="docker image ls --format 'table{{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}'"
# delete all images
alias drmi="docker images -q | xargs -r docker rmi -f"

# list volumes nicely formatted
alias dlsv="docker volume ls --format 'table{{.Name}}\t{{.Driver}}\t{{.Mountpoint}}'"
# delete all volumes
alias drmv="docker volume ls -q | xargs -r docker volume rm -f"

# list networks nicely formatted
alias dlsn="docker network ls --format 'table{{.Name}}\t{{.Driver}}\t{{.Scope}}'"
# delete all networks
alias drmn="docker network ls -q | xargs -r docker network rm -f"

# delete all containers and images (both dangling and unused)
alias dprune="docker system prune -af --volumes && docker volume ls -q | xargs -r docker volume rm -f"
