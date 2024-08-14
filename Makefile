WGET=wget

# get specifications from EBI too?
# get DATA from EBI/ENA?

# what data to mirror and possibly restructure here vs accessing via APIs?

# document use of APIs here
# https://www.ebi.ac.uk/biosamples/samples/SAMEA104726483.json
# https://www.ebi.ac.uk/ena/browser/advanced-search
# https://www.ebi.ac.uk/ena/portal/api/swagger-ui/index.html
# https://www.ebi.ac.uk/ena/taxonomy/rest/swagger-ui/index.html

# very complex documents; many are too large to load into a MongoDB BSON document
local/bioproject.xml:
	$(WGET) -O $@ "https://ftp.ncbi.nlm.nih.gov/bioproject/bioproject.xml" # ~ 3 GB August 2024

local/biosample_set.xml.gz:
	$(WGET) -O $@ "https://ftp.ncbi.nlm.nih.gov/biosample/biosample_set.xml.gz" # ~ 3 GB August 2024

local/biosample_set.xml: local/biosample_set.xml.gz
	gunzip -c $< > $@

local/books.xml:
	$(WGET) -O $@ "https://www.w3schools.com/xml/books.xml"

# 8 years old
local/biosample.xsd:
	$(WGET) -O $@ "https://www.ncbi.nlm.nih.gov/viewvc/v1/trunk/submit/public-docs/biosample/biosample.xsd?view=co"
