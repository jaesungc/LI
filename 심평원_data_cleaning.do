** #1. 심평원 의료기관 주소록 데이터

use health_institute_list, replace

* drop  phone postal_code homepage
gen temp=address
split temp, p("(")
split temp2, p(,)
replace temp21=subinstr(temp21,")","",.)
rename temp21 dong
order dong, before(address)
split dong, p(.)

split address
rename address1 region
rename address2 district
order serial category name region district dong address

replace region="서울" if region=="서울특별시"
replace region="부산" if region=="부산광역시"
replace region="대구" if region=="대구광역시"
replace region="인천" if region=="인천광역시"
replace region="광주" if region=="광주광역시"
replace region="대전" if region=="대전광역시"
replace region="울산" if region=="울산광역시"
replace region="경기" if region=="경기도"
replace region="강원" if region=="강원도"
replace region="충북" if region=="충청북도"
replace region="충남" if region=="충청남도"
replace region="전북" if region=="전라북도"
replace region="전남" if region=="전라남도"
replace region="경북" if region=="경상북도"
replace region="경남" if region=="경상남도"
replace region="제주" if region=="제주도"
replace region="제주" if region=="제주특별자치도"
replace region="세종" if region=="세종특별자치시"

keep serial-address
compress

save 심평원_주소록_cleaned, replace
