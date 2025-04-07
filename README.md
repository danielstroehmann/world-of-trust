# World of Trust
## What?
The script simply grabs the Root CAs from a supplied list of domains.
## Why?
Mainly for fun, but have you ever wondered who your favorite apps and sites trust?
## Requirements?
* linux
* parallel ( `apt install parallel` )
## How?
Run `./extract.sh <domainlist.txt>`
## Details
Example domain list:  
```  
www.mars.com
www.mondelezinternational.com
www.ferrero.com
www.thehersheycompany.com
www.nestle.com
...  
```  
There are a few example files with domain lists as an inspiration in this repo (AI generated, not doubled-checked)
## Feedback
If you like to share, let me know what lists you generated and about the results :-)
