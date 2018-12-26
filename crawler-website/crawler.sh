#!/bin/bash
# used command: httrack, tar, echo, wget, du -sh

path_to_aspiration_internet="/home/florianccj/aspiration-internet"
ptai=${path_to_aspiration_internet}

db=(
	"dev.mysql.com/doc"
	"mariadb.com/kb/en/library"
	"www.postgresql.org/docs/manuals"
)
forge=(
        "docs.gitlab.com" 
        "docs.docker.com"

        "docs.puppet.com"
        "docs.ansible.com" 
)
framework=(
        "docs.djangoproject.com"
        "symfony.com"
        "fr.vuejs.org"
        "reactjs.org"
	"angular.io"
)
hosts=(
	"kubernetes.io"
)
old_hosts=(
	"v1-12.docs.kubernetes.io"
	"v1-11.docs.kubernetes.io" 
	"v1-10.docs.kubernetes.io" 
	"v1-9.docs.kubernetes.io"
)
server=(
	"httpd.apache.org"
	"nginx.org"
)

sites=(
	$(echo ${db[*]})
#	$(echo ${forge[*]})
#	$(echo ${framework[*]})
#	$(echo ${hosts[*]})
#	$(echo ${old_hosts[*]})
#	$(echo ${server[*]})
)

echo ${sites[*]}

for site in ${sites[*]}; do
	new_site_path_without_slash=${site//\//_}
	nspws=${new_site_path_without_slash}
	echo "-------------------------------------------------" 
	echo "${site} in ${nspws}"
	echo "-------------------------------------------------"

	httrack "https://${site}/" -O "${ptai}/doc/${nspws}" -v
	tar cvfz ./tar/${nspws}.tar.gz ./doc/${nspws}
done

# sites=("www.jfrog.com")

# wget --mirror --convert-links --adjust-extension --page-requisite --no-parent https://${site}/

# tar cfz ${site}.tar.gz ${site}

du -sh ${ptai}/doc/*
du -sh ${ptai}/tar/*

