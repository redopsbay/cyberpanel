#!/bin/bash

## Regular Colors.

export BLUE='\e[1;94m'
export GREEN='\e[1;92m'
export RED='\e[1;91m'
export RESETCOLOR='\e[1;00m'
export BLACK='\e[0;30m'
export REGRED='\e[0;31m'
export REGGREEN='\e[0;32m'
export YELLOW='\e[0;33m'
export PURPLE='\e[0;35m'
export CYAN='\e[0;36m'
export WHITE='\e[0;37m'

## Bolder Colors

export BOLDBLACK='\e[1;30m'
export BOLDRED='\e[1;31m'
export BOLDGREEN='\e[1;32m'
export BOLDYELLOW='\e[1;33m'
export BOLDBLUE='\e[1;34m'
export BOLDPURPLE='\e[1;35m'
export BOLDCYAN='\e[1;36m'
export BOLDWHITE='\e[1;37m'

## Underlined Colors

export UNDERBLACK='\e[4;30m'
export UNDERRED='\e[4;31m'
export UNDERGREEN='\e[4;32m'
export UNDERYELLOW='\e[4;33m'
export UNDERBLUE='\e[4;34m'
export UNDERPURPLE='\e[4;35m'
export UNDERPURPLE='\e[4;36m'
export UNDERWHITE='\e[4;37m'

## Background colors

export BACKBLACK='\e[40m'
export BACKRED='\e[41m'
export BACKGREEN='\e[42m'
export BACKYELLOW='\e[43m'
export BACKBLUE='\e[44m'
export BACKPURPLE='\e[45m'
export BACKCYAN='\e[46m'
export BACKWHITE='\e[47m'
export TEXTRESET='\e[0m'

## Regex Variable Patterns

special_chars="(\:|\/|\?|\#|\@|\!|\\$|\&|\'|\(|\)|\*|\+|\,|\;|\=|\%|\[|\])"
username_special_chars="(\:|\/|\?|\#|\!|\\$|\&|\'|\(|\)|\*|\+|\,|\;|\=|\%|\[|\])"
email_pattern="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
#email_pattern="[A-Za-z0-9]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}$"
acl_pattern="admin\|reseller\|user\|Customer"
security_level="HIGH\|LOW"
package_pattern="Default\|admin_Standard\|admin_Professional\|admin_Enterprise"
dns_record_pattern="A\|AAAA\|CNAME\|MX\|TXT\|SPF\|NS\|SOA\|SRV\|CAA"
php_version_pattern="5\.3\|5\.4\|5\.5\|5\.6\|7\.0\|7\.1\|7\.2\|7\.3\|7\.4"
domain_pattern="(?*\.com|*\.ph|*\.org|*\.net|*\.edu|*\.gov|*\.www|www\.*)"
ipv4_pattern="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
only_numeric="[A-Za-z]"

function Options()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      User Functions                                 *"
	echo "***********************************************************************"
	echo "1) Automatic Creation (Standard)"
	echo "2) Create User"
	echo "3) Delete User"
	echo "4) Suspend User"
	echo "5) Unsuspend User"
	echo "6) Edit User"
	echo "7) List Users"
	echo -e $GREEN
	echo "***********************************************************************"
	echo "*                      Website Functions                              *"
	echo "***********************************************************************"
	echo "8) Create Website"
	echo "9) Delete Website"
	echo "10) Create Child Domain"
	echo "11) Delete Child Domain"
	echo "12) List Websites"
	echo "13) Change PHP Version"
	echo "14) Change Package"
	echo -e $WHITE
	echo "***********************************************************************"
	echo "*                      DNS Functions                                  *"
	echo "***********************************************************************"
	echo "15) List DNS Zones"
	echo "16) List DNS Records"
	echo "17) Create DNS Zone"
	echo "18) Delete DNS Zone"
	echo "19) Create DNS Record"
	echo "20) Delete DNS Record"
	echo -e $BLUE
	echo "***********************************************************************"
	echo "*                      Backup Functions                               *"
	echo "***********************************************************************"
	echo "21) Create Backup"
	echo "22) Restore Backup"
	echo -e $WHITE
	echo "***********************************************************************"
	echo "*                      Package Functions                              *"
	echo "***********************************************************************"
	echo "23) Create Package"
	echo "24) Delete Package"
	echo "25) List Packages"
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      Database Functions                             *"
	echo "***********************************************************************"
	echo "26) Create Database"
	echo "27) Delete Database"
	echo "28) List Databases"
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      Email Functions                                *"
	echo "***********************************************************************"
	echo "29) Create Email"
	echo "30) Delete Email"
	echo "31) Change Email Password"
	echo "32) List Emails"
	echo -e $BLUE
	echo "***********************************************************************"
	echo "*                      FTP Functions                                  *"
	echo "***********************************************************************"
	echo "33) Create FTP Account"
	echo "34) Delete FTP Account"
	echo "35) Change FTP Password"
	echo "36) List FTP Accounts"
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      SSL Functions                                  *"
	echo "***********************************************************************"
	echo "37) Issue SSL"
	echo "38) Hostname SSL"
	echo "39) Mail Server SSL"
	echo -e "\n\n"
	echo -e $TEXTRESET
}

## User Functions

function createUser()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - Create User                      *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter firstname (No Special Chars): " firstName
	echo $firstName | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] There is a special characters!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createUser
	fi

	unset is_special

	read -p "Enter lastname (No Special Chars): " lastName
	echo $lastName | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] There is a special characters!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createUser
	fi
	unset is_special

	read -p "Enter Email Address: " email
	echo $email | egrep $email_pattern >> /dev/null && is_email="true"
	if [[ $is_email != "true" ]]; then
  		echo "[!] Not a valid email address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset is_email

	read -p "Enter Username (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset is_special


	read -s -p "Enter Secure Password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm Secure Password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] Secure Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	read -p "Websites Limit 0 - Unlimited (Not Recommended): " weblimit
	echo -e $weblimit | grep --invert-match "[0-9]" >> /dev/null || num_only="true"
	if [[ $num_only != "true" ]]; then
  		echo "[!] Web Limit Should not contain non-numeric characters!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset num_only

	read -p "ACL Method (admin, reseller, user, Customer - Recommended) : " acl
	echo -e $acl | grep -w $acl_pattern >> /dev/null && right_acl="true"
	if [[ $right_acl != "true" ]]; then
  		echo "[!] Wrong ACL Choice!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset right_acl

	read -p "Security Level (HIGH or LOW) : " sec_level
	echo -e $sec_level | grep -w $security_level >> /dev/null && sec_level_true="true"
	if [[ $sec_level_true != "true" ]]; then
  		echo "[!] Wrong ACL Choice!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "FirstName: $firstName"
	echo "LastName: $lastName"
	echo "Email: $email"
	echo "Username: $userName"
	echo "Password: $SecurePassword"
	echo "SecurePassword: $SecurePassword"
	echo "Web Limit: $weblimit"
	echo "ACL: $acl"
	echo "Security Level: $sec_level"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createUser --firstName $firstName --lastName $lastName --email $email --userName $userName --password $SecurePassword --websitesLimit $weblimit --selectedACL $acl --securityLevel $sec_level
		unset firstName
		unset lastName
		unset email
		unset userName
		unset SecurePassword
		unset weblimit
		unset acl
		unset sec_level
		exit 0
	else
		echo -e "[*] Reverting..."
		unset firstName
		unset lastName
		unset email
		unset userName
		unset SecurePassword
		unset weblimit
		unset acl
		unset sec_level
		sleep 2
		clear
		createUser
	fi
}

function deleteUser()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - Delete User                      *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Username (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteUser
	fi

	unset is_special

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteUser --userName $userName || exit -1
		unset userName
		exit 0
	else
		echo -e "[*] Reverting..."
		sleep 2
		clear
		deleteUser
	fi
}

function suspendUser()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - SuspendUser                      *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Username to be suspended (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		suspendUser
	fi

	unset is_special

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel suspendUser --userName $userName --state SUSPEND || exit -1
		exit 0
		unset userName
	else
		echo -e "[*] Reverting..."
		sleep 2
		clear
		deleteUser
	fi
}

function unSuspendUser()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - UnSuspend User                   *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Username to be unsuspended (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		suspendUser
	fi

	unset is_special

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel suspendUser --userName $userName --state UNSUSPEND || exit -1
		exit 0
		unset userName
	else
		echo -e "[*] Reverting..."
		sleep 2
		clear
		deleteUser
	fi
}

function editUser()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - Edit User                        *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Username (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset is_special

	read -p "Enter firstname (No Special Chars): " firstName
	echo $firstName | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] There is a special characters!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createUser
	fi

	unset is_special

	read -p "Enter lastname (No Special Chars): " lastName
	echo $lastName | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] There is a special characters!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createUser
	fi
	unset is_special

	read -p "Enter Email Address: " email
	echo $email | egrep $email_pattern >> /dev/null && is_email="true"
	if [[ $is_email != "true" ]]; then
  		echo "[!] Not a valid email address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	unset is_email

	read -s -p "Enter Secure Password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm Secure Password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] Secure Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	read -p "Security Level (HIGH or LOW) : " sec_level
	echo -e $sec_level | grep -w $security_level >> /dev/null && sec_level_true="true"
	if [[ $sec_level_true != "true" ]]; then
  		echo "[!] Wrong ACL Choice!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createUser
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	echo "FirstName: $firstName"
	echo "LastName: $lastName"
	echo "Email: $email"
	echo "Password: $SecurePassword"
	echo "SecurePassword: $SecurePassword"
	echo "Security Level: $sec_level"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel editUser --userName userName --firstName $firstName --lastName $lastName --email $email --password $SecurePassword --securityLevel $sec_level
		unset firstName
		unset lastName
		unset email
		unset userName
		unset SecurePassword
		unset sec_level
		exit 0
	else
		echo -e "[*] Reverting..."
		unset firstName
		unset lastName
		unset email
		unset userName
		unset SecurePassword
		unset sec_level
		sleep 2
		clear
		createUser
	fi
}

function listUsers()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   User Functions - List Users                       *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	cyberpanel listUsers | sed -e 's/,/\n/g' | sed -e 's/\\//g' | sed -e 's/\"//g' | sed -e 's/{//g' | sed -e 's/}/\n/g'
}

## Web Functions

function createWebsite()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   Website Functions - Create Website                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter Package (Default | admin_Standard | admin_Professional | admin_Enterprise): " Package
	echo $Package | grep -w  $package_pattern >> /dev/null && is_package="true"
	if [[ $is_package != "true" ]]; then
  		echo "[!] Package Choice Cannot be found!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createWebsite
	fi
	unset is_package

	read -p "Enter Username of the Web Owner (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createWebsite
	fi
	unset is_special

	read -p "Enter the website domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createWebsite
	fi
	unset is_domain

	read -p "Enter Email Address: " email
	echo $email | egrep $email_pattern >> /dev/null && is_email="true"
	if [[ $is_email != "true" ]]; then
  		echo "[!] Not a valid email address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createWebsite
	fi
	unset is_email

	echo -e "Available PHP Versions: 5.3 | 5.4 | 5.5 | 5.6 | 7.0 | 7.1 | 7.2 | 7.3 | 7.4"
	read -p "Enter PHP Version: " php_version
	echo $php_version | grep -w $php_version_pattern >> /dev/null && is_php="true"
	if [[ $is_php != "true" ]]; then
  		echo "[!] Not a valid PHP Version!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createWebsite
	fi
	unset is_php

	read -p "Do you want to enable SSL (YES/NO)?: " Ssl
	Ssl=`echo $Ssl | tr [:lower:] [:upper:]`
	if [[ $Ssl = "YES" ]]; then
  		ssl_support=1
  	else
  		ssl_support=0
	fi

	read -p "Do you want to enable DKIM (YES/NO)?: " Dkim
	Dkim=`echo $Dkim | tr [:lower:] [:upper:]`
	if [[ $Dkim = "YES" ]]; then
  		dkim_support=1
  	else
  		dkim_support=0
	fi

	read -p "Do you want to enable openBasedir Protection (YES/NO)?: " Openbase
	Openbase=`echo $Openbase | tr [:lower:] [:upper:]`
	if [[ $Openbase = "YES" ]]; then
  		openbase_support=1
  	else
  		openbase_support=0
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Package: $Package"
	echo "Username (Owner): $Domain"
	echo "Email: $email"
	echo "PHP Version: $php_version"
	echo "SSL Support: $Ssl"
	echo "DKIM Support: $Dkim"
	echo "Open Base Directory Protection Enable: $Openbase"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createWebsite --package $Package --owner $userName --domainName $Domain --email $email --php $php_version --ssl $ssl_support --dkim $dkim_support --openBasedir $openbase_support
		unset Package
		unset userName
		unset Domain
		unset email
		unset php_version
		unset Ssl
		unset Dkim
		unset Openbase
		unset choice
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Package
		unset userName
		unset Domain
		unset email
		unset php_version
		unset Ssl
		unset Dkim
		unset Openbase
		unset choice
		sleep 2
		clear
		createWebsite
	fi

}

function deleteWebsite()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   Website Functions - Delete Website                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website domain to be deleted: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteWebsite
	fi
	unset is_domain

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteWebsite --domainName $Domain
		unset Domain
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset choice
		deleteWebsite
	fi
}

function createChildDomain()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 Website Functions - Create Child Domain             *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createChildDomain
	fi
	unset is_domain

	read -p "Enter the website Child Domain to be use: " child_Domain
	echo $child_Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createChildDomain
	fi
	unset is_domain

	read -p "Enter Username of the Web Owner (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createChildDomain
	fi
	unset is_special
	
	echo -e "Available PHP Versions: 5.3 | 5.4 | 5.5 | 5.6 | 7.0 | 7.1 | 7.2 | 7.3 | 7.4"
	read -p "Enter PHP Version: " php_version
	echo $php_version | grep -w $php_version_pattern >> /dev/null && is_php="true"
	if [[ $is_php != "true" ]]; then
  		echo "[!] Not a valid PHP Version!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createWebsite
	fi
	unset is_php

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Master Domain: $Domain"
	echo "Child Domain: $child_Domain"
	echo "Username: $userName"
	echo "PHP Version: $php_version"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createChild --masterDomain $Domain --childDomain $child_Domain --owner $userName --php $php_version
		unset Domain
		unset child_Domain
		unset userName
		unset php_version
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset child_Domain
		unset userName
		unset php_version
		unset choice
		deleteWebsite
	fi
}

function deleteChildDomain()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                Website Functions - Delete Child Domain              *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter the child domain to be deleted: " child_Domain
	echo $child_Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteChildDomain
	fi
	unset is_domain

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Child Domain: $child_Domain"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteChild --childDomain $child_Domain
		unset child_Domain
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset child_Domain
		unset choice
		deleteChildDomain
	fi
}

function listWebsite()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                   Website Functions - List Website                  *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	cyberpanel listWebsitesPretty
}

function changePHP()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                Website Functions - Change PHP Version               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changePHP
	fi
	unset is_domain

	echo -e "Available PHP Versions: 5.3 | 5.4 | 5.5 | 5.6 | 7.0 | 7.1 | 7.2 | 7.3 | 7.4"
	read -p "Enter PHP Version: " php_version
	echo $php_version | grep -w $php_version_pattern >> /dev/null && is_php="true"
	if [[ $is_php != "true" ]]; then
  		echo "[!] Not a valid PHP Version!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changePHP
	fi
	unset is_php
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "PHP Version: $php_version"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel changePHP --domainName $Domain --php $php_version
		unset Domain
		unset php_version
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset php_version
		unset choice
		deleteWebsite
	fi
}

function changePackage()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                Website Functions - Change Package                   *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changePackage
	fi
	unset is_domain

	read -p "Enter Package (Default | admin_Standard | admin_Professional | admin_Enterprise): " Package
	echo $Package | grep -w $package_pattern >> /dev/null && is_package="true"
	if [[ $is_package != "true" ]]; then
  		echo "[!] Package Choice Cannot be found!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		changePackage
	fi
	unset is_package

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "Package: $Package"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel changePackage --domainName $Domain --packageName $Package
		unset Domain
		unset Package
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset Package
		unset choice
		deleteWebsite
	fi
}

## DNS Functions

function listDNSZones()
{
	echo "***********************************************************************"
	echo "*                    DNS Functions  - List DNS Zones                  *"
	echo "***********************************************************************"
	cyberpanel listDNSZonesPretty
}

function listDNSRecords()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    DNS Functions  - List DNS Records                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		listDNSRecords
	fi
	unset is_domain
	cyberpanel listDNSPretty --domainName $Domain

}

function createDNSZone()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    DNS Functions  - Create DNS Zones                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter Username of the Web Owner (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSZone
	fi
	unset is_special
	
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSZone
	fi
	unset is_domain
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $Username"
	echo "Domain: $Domain"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createDNSZone --owner $userName --domainName $Domain	
		unset userName
		unset Domain
		unset choice
		exit 0
	else
		echo -e "[*] Reverting..."
		unset userName
		unset Domain
		unset choice
		sleep 2
		clear
		createDNSZone
	fi
}

function deleteDNSZone()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    DNS Functions  - Delete DNS Zone                 *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteDNSZone
	fi
	unset is_domain
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteDNSZone --domainName $Domain
		unset Domain
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset choice
		deleteDNSZone
	fi
}

function createDNSRecord()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    DNS Functions  - Create DNS Record               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_domain

	read -p "Enter the new record name: " new_Domain
	echo $new_Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_domain
	echo "Valid Record Types are: A AAAA CNAME MX TXT SPF NS SOA SRV CAA"
	read -p "Enter the record type: " recordType
	echo $recordType | grep -w $dns_record_pattern >> /dev/null && is_record="true"
	if [[ $is_record != "true" ]]; then
  		echo "[!] Not a valid DNS record type!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_record

	read -p "Enter the ip address value: " ipv4_address
	echo $ipv4_address | egrep -w $ipv4_pattern >> /dev/null && is_ip="true"
	if [[ $is_ip != "true" ]]; then
  		echo "[!] Not a valid ip address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_ip

	read -p "Enter DNS priority recommended is 0: " priority
	echo $priority | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid priority value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_num


	read -p "Enter TTL default is 3600: " TTL
	echo $TTL | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid TTL Value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDNSRecord
	fi
	unset is_num

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "New Record Name: $new_Domain"
	echo "Record Type: $recordType"
	echo "IPV4: ipv4_address"
	echo "Priority: $priority"
	echo "TTL: $TTL"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createDNSRecord --domainName $Domain --name $new_Domain --recordType $recordType --value $ipv4_address --priority $priority --ttl $TTL
		unset Domain
		unset new_Domain
		unset recordType
		unset ipv4_address
		unset priority
		unset TTL
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset new_Domain
		unset recordType
		unset ipv4_address
		unset priority
		unset TTL
		unset choice
		createDNSRecord
	fi

}

function deleteDNSRecord()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    DNS Functions  - Delete DNS Record               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to get the record id's: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteDNSRecord
	fi
	unset is_domain

	cyberpanel listDNSPretty --domainName $Domain

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*         Becarefull! You need to enter only the record ID!           *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter the record ID: " ID
	echo $ID | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid record ID!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteDNSRecord
	fi
	unset is_num

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "Record ID: $ID"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteDNSRecord --recordID 200
		echo "[*] Listing DNS Records..."
		sleep 2
		cyberpanel listDNSPretty --domainName $Domain
		unset Domain
		unset ID
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset $Domain
		unset ID
		unset choice
		deleteDNSRecord
	fi

}

## Backup Functions

function createBackup()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Backup Functions  - Create Backup                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createBackup
	fi
	unset is_domain

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createBackup --domainName $Domain
		unset Domain
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset choice
		createBackup
	fi
}

function restoreBackup()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Backup Functions  - Restore Backup               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter filename: " filename
	echo "[!] WARNING! Restoring backup might contain outdated files!"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		if [ -e $filename ]; then
  		cyberpanel restoreBackup --fileName $filename
  		unset filename
  		unset choice
		echo "Done..."
		exit 0
	  	else
	  		echo ""
		fi
	else
		echo -e "[*] Reverting..."
		unset choice
		restoreBackup
	fi
}

## Package Functions

function createPackage()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Package Functions  - Create Package              *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Username (No Special Chars Except Email Pattern): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi

	unset is_special

	read -p "Enter Package the new package name example (Default | admin_Standard | admin_Professional | admin_Enterprise): " Package
	echo $Package | grep -w $package_pattern >> /dev/null || is_package="true"
	if [[ $is_package != "true" ]]; then
  		echo "[!] You entered an existing package name!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createPackage
	fi
	unset is_package

	read -p "Enter disk space for example (1024)/1GB: " diskSpace
	echo $diskSpace | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid Disk Space Value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	read -p "Enter the bandwidth (1024)/1GB: " bandwidth
	echo $bandwidth | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid BandWidth Value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	read -p "Enter the number of allowed email accounts to be created: " num_email
	echo $num_email | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	read -p "Enter the number of allowed databases  to be created: " num_db
	echo $num_db | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	read -p "Enter the number of allowed ftp accounts to be created: " num_ftp
	echo $num_ftp | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	read -p "Enter the number of allowed domains to be created: " num_domain
	echo $num_domain | egrep only_numeric >> /dev/null || is_num="true"
	if [[ $is_num != "true" ]]; then
  		echo "[!] Not a valid value!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createPackage
	fi
	unset is_num

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	echo "Package: $Package"
	echo "Disk Space: $diskSpace"
	echo "Bandwidth: $bandwidth"
	echo "Emails: $num_email"
	echo "Databases: $num_db"
	echo "FTPs: $num_ftp"
	echo "Domains: $num_domains"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createPackage --owner $userName --packageName $Package --diskSpace $diskSpace --bandwidth $bandwidth --emailAccounts $num_email --dataBases $num_db --ftpAccounts $num_ftp --allowedDomains $num_domain
		unset userName
		unset Package
		unset diskSpace
		unset bandwidth
		unset num_email
		unset num_ftp
		unset num_domain
		unset num_db
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset userName
		unset Package
		unset diskSpace
		unset bandwidth
		unset num_email
		unset num_ftp
		unset num_domain
		unset num_db
		unset choice
		createPackage
	fi
}

function deletePackage()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Package Functions - Delete Package               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	cyberpanel listPackagesPretty
	read -p "Enter package name: " Package
	echo $Package | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Invalid Package Name!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		deletePackage
	fi
	unset is_special
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Package: $Package"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deletePackage --packageName $Package
		unset Package
		unset choice
		echo "Done..."
		cyberpanel listPackagesPretty
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Package
		unset choice
		deletePackage
	fi

}

function listPackages()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Package Functions - List Packages                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	cyberpanel listPackagesPretty
}

## Database Functions

function createDatabase()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Database Functions  - Create Database            *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter the website domain: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDatabase
	fi
	unset is_domain

	read -p "Enter database name (No Special Chars): " Db
	echo $Db | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Invalid database name!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createDatabase
	fi
	unset is_special

	read -p "Enter database username (No Special Chars): " db_username
	echo $db_username | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Invalid database username!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createDatabase
	fi
	unset is_special

	read -s -p "Enter database password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm database password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] database Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createDatabase
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "Database: $Db"
	echo "Database username: $db_username"
	echo "Password: $SecurePassword"
	echo "Confirm Password: $ConfirmSecurePassword"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createDatabase --databaseWebsite cyberpanel.net --dbName cyberpanel --dbUsername cyberpanel --dbPassword cyberpanel
		unset Domain
		unset Db
		unset db_username
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset Db
		unset db_username
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		createDatabase
	fi
}

function deleteDatabase()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Database Functions  - Delete Database            *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter database name (No Special Chars): " Db
	echo $Db | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Invalid database name!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		deleteDatabase
	fi
	unset is_special

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Database: $Db"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteDatabase --dbName $Db
		unset Db
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Db
		deleteDatabase
	fi
}

function listDatabase()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                Database Functions - List Database                   *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changePackage
	fi
	unset is_domain
	cyberpanel listDatabasesPretty --databaseWebsite $Domain
}

## Email Functions

function createEmail()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 Email Functions - Create Email                      *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createEmail
	fi
	unset is_domain

	read -p "Enter Username (without @$Domain): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createEmail
	fi

	read -s -p "Enter the email password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm the email password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] Email Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createEmail
	fi

	unset is_special
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "Email: $userName@$Domain"
	echo "Password: $SecurePassword"
	echo "Confirm Password: $ConfirmSecurePassword"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createEmail --domainName $Domain --userName $userName --password $SecurePassword
		unset Domain
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		createEmail
	fi
}

function deleteEmail()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 Email Functions - Delete Email                      *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Email Address: " email
	echo $email | egrep $email_pattern >> /dev/null && is_email="true"
	if [[ $is_email != "true" ]]; then
  		echo "[!] Not a valid email address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteEmail
	fi

	unset is_email

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Email: $email"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteEmail --email $email
		unset choice
		unset email
		echo "Done..."
		exit 0
	else
		unset choice
		unset email
		deleteEmail
	fi
}

function changeEmailPassword()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*              Email Functions - Change Email Password                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET

	read -p "Enter Email Address: " email
	echo $email | egrep $email_pattern >> /dev/null && is_email="true"
	if [[ $is_email != "true" ]]; then
  		echo "[!] Not a valid email address!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changeEmailPassword
	fi

	unset is_email

	read -s -p "Enter new email password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm new email password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] Email Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changeEmailPassword
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Email: $email"
	echo "Password: $SecurePassword"
	echo "Confirm Password: $ConfirmSecurePassword"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel changeEmailPassword --email $email --password $SecurePassword
		unset email
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset email
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		changeEmailPassword
	fi
}

function listEmails()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 Email Functions - List Available Emails             *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the email master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		listEmails
	fi
	cyberpanel listEmailsPretty --domainName $Domain
	unset is_domain
}

## FTP Functions

function createFTP()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 FTP Functions - Create FTP Account                  *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createFTP
	fi
	unset is_domain

	read -p "Enter Username (without @$Domain): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createFTP
	fi

	read -s -p "Enter new ftp password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm new ftp password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] FTP Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		createFTP
	fi

	read -p "Enter FTP owner (No Special Chars): " owner
	echo $owner | grep -P  $special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Invalid FTP owner!"
  		echo "[*] Reverting...."
  		sleep 2 
  		clear
  		createFTP
	fi
	unset is_special

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Domain: $Domain"
	echo "Username: $userName"
	echo "Password: $SecurePassword"
	echo "Confirm Password: $ConfirmSecurePassword"
	echo "Owner: $owner"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel createFTPAccount --domainName $Domain --userName $userName --password $SecurePassword --owner $owner
		unset Domain
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset owner
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset Domain
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset owner
		unset choice
		createFTP
	fi
}

function deleteFTP()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 FTP Functions - Delete FTP Account                  *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter Username (without @$Domain): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		deleteFTP
	fi
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel deleteFTPAccount --userName cyberpanel
		unset userName
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset userName
		unset choice
		deleteFTP
	fi
}

function changeFTPPassword()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 FTP Functions - Change FTP Password                 *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter Username (without @$Domain): " userName
	echo $userName | grep -P $username_special_chars >> /dev/null || is_special="true"
	if [[ $is_special != "true" ]]; then
  		echo "[!] Not a valid username!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changeFTPPassword
	fi
	read -s -p "Enter ftp password: " SecurePassword
    echo -e '\n'
	read -s -p "Confirm ftp password: " ConfirmSecurePassword
	echo -e "\n"
	if [[ $SecurePassword != $ConfirmSecurePassword ]]; then
  		echo "[!] FTP Password Did Not Match!!!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		changeFTPPassword
	fi

	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                      	Details You Entered                         *"
	echo "***********************************************************************"
	echo "Username: $userName"
	echo "Password: $SecurePassword"
	echo "Confirm Password: $ConfirmSecurePassword"
	read -p "Are you sure about this? [Y/N]: " choice
	choice=`echo $choice | tr [:lower:] [:upper:]`
	if [ $choice = "Y" ] ; then
		cyberpanel changeFTPPassword --userName $userName --password $SecurePassword
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		echo "Done..."
		exit 0
	else
		echo -e "[*] Reverting..."
		unset userName
		unset SecurePassword
		unset ConfirmSecurePassword
		unset choice
		changeFTPPassword
	fi
}

function listFTP()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                FTP Functions - List FTP Accounts                    *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		listFTP
	fi
	unset is_domain
	cyberpanel listFTPPretty --domainName $Domain
}

## SSL Functions

function issueSSL()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                SSL Functions - Issue SSL to Domain                  *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	echo "[*] Do not enter a child domain"
	read -p "Enter the website master domain to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		issueSSL
	fi
	unset is_domain
	cyberpanel issueSSL --domainName $Domain
}

function issueHostnameSSL()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                SSL Functions - Issue SSL Hostname                   *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter the hostname to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		issueSSL
	fi
	unset is_domain
	cyberpanel hostNameSSL --domainName $Domain
}

function issueMailServerSSL()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*              SSL Functions - Issue SSL on Mail Server               *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	read -p "Enter the mail server to be use: " Domain
	echo $Domain | egrep -e $domain_pattern >> /dev/null && is_domain="true"
	if [[ $is_domain != "true" ]]; then
  		echo "[!] Not a valid domain name!"
  		echo "[*] Reverting...."
  		sleep 2
  		clear
  		issueSSL
	fi
	unset is_domain
	cyberpanel mailServerSSL --domainName $Domain
}

function standard()
{
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                    Automatic Creation (standard)                    *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	createUser
	createWebsite
	createDatabase
	issueSSL
}

function Main()
{
	clear
	echo -e $YELLOW
	echo "***********************************************************************"
	echo "*                 Welcome to Cyber Panel Helper Script                *"
	echo "***********************************************************************"
	echo -e $TEXTRESET
	Options
	read -p "Enter your choice: " choice
	if [[ $choice -gt 39 || $choice -lt 1 ]]; then
		echo "[!] Error! Index Out-Of-Range!!!"
		sleep 1
		Main
	fi
	case $choice in
		"1")
			standard
		;;
		'2')
			createUser
		;;
		'3')
			deleteUser
		;;
		'4')
			suspendUser
		;;
		'5')
			unSuspendUser
		;;
		'6')
			editUser
		;;
		'7')
			listUsers
		;;
		'8')
			createWebsite
		;;
		'9')
			deleteWebsite
		;;
		'10')
			createChildDomain
		;;
		'11')
			deleteChildDomain
		;;
		'12')
			listWebsite
		;;
		'13')
			changePHP
		;;
		'14')
			changePackage
		;;
		'15')
			listDNSZones
		;;
		'16')
			listDNSRecords
		;;
		'17')
			createDNSZone
		;;
		'18')
			deleteDNSZone
		;;
		'19')
			createDNSRecord
		;;
		'20')
			deleteDNSRecord
		;;
		'21')
			createBackup
		;;
		'22')
			restoreBackup
		;;
		'23')
			createPackage
		;;
		'24')
			deletePackage
		;;
		'25')
			listPackages
		;;
		'26')
			createDatabase
		;;
		'27')
			deleteDatabase
		;;
		'28')
			listDatabase
		;;
		'29')
			createEmail
		;;
		'30')
			deleteEmail
		;;
		'31')
			changeEmailPassword
		;;
		'32')
			listEmails
		;;
		'33')
			createFTP
		;;
		'34')
			deleteFTP
		;;
		'35')
			changeFTPPassword
		;;
		'36')
			listFTP
		;;
		'37')
			issueSSL
		;;
		'38')
			issueHostnameSSL
		;;
		'39')
			issueMailServerSSL
		;;
	esac

}

is_cyberpanel=`which cyberpanel`
if [[ -e $is_cyberpanel ]]; then
	Main
else
	echo "[*] Please install cyberpanel CLI first!"
	exit -1
fi
