---
typora-root-url: image
---

## Crawling Website Using lxml Python

Crawling adalah script program yang digunakan untuk melakukan scan pada halaman suatu website, biasanya digunakan untuk mencari suatu data atau informasi.

Kali ini saya membuat *web crawl* untuk mengambil data dari website itunes app store, ketika user melakukan *view* sebuah aplikasi di app store biasanya akan muncul beberapa rekomendasi aplikasi yang sejenis, data yang akan saya ambil adalah data rekomendasi aplikasi yang sejenis dengan *Candy Crush Saga*.



**Step 1 : Siapkan URL website**

Tentukan website apa yang ingin anda *crawling* .

![1](/1.PNG)



**Step 2 : Install library lxml dan requests **

Install library lxml dan requests dengan mengetikkan perintah pada cmd :

```python
pip install lxml
```

```python
pip install requests
```



**Step 3 : Melakukan inspeksi elemen**

Inspeksi elemen dilakukan untuk mengetahui :

1. letak informasi dari data yang ingin kita ambil dalam website, contoh letak informasi nama aplikasi yang terletak pada tag html :

   ```html
   <h1 class="product-header__title app-header__title">
       Candy Crush Saga
   </h1>
   ```

   ![2](/2.png)

2. letak link dari rekomendasi aplikasi yang disarankan, untuk mengetahui itu kita perlu mencari daftar *You May Also Like* 

   ![3](/3.png)

   ![5](/5.png)

   

**Step 4 : Membuat code web crawl**

import library lxml dan requests.

```python
from lxml import html
import requests
```

Membuat class AppCrawler, digunakan untuk menampung data dan link dari aplikasi yang termasuk dalam rekomendasi/saran. 

```python
class AppCrawler:
    def __init__(self,starting_url,depth):
        self.starting_url = starting_url
        self.depth = depth
        self.current_depth = 0
        self.depth_links=[]
        self.apps = []

    def crawl(self):
        app = self.get_app_from_link(self.starting_url)
        self.apps.append(app)
        self.depth_links.append(app.links)

        while self.current_depth < self.depth:
            current_links = []
            for link in self.depth_links[self.current_depth]:
                current_app = self.get_app_from_link(link)
                current_links.extend(current_app.links)
                self.apps.append(current_app)

            self.current_depth +=1
            self.depth_links.append(current_links)


    def get_app_from_link(self,link):
        start_page = requests.get(link)
        tree = html.fromstring(start_page.text)

        name = tree.xpath('//h1[@class="product-header__title app-header__title"]/text()')[0] #inspeksiel_1
        developer = tree.xpath('//h2/a[@class="link"]/text()')[0] #inspeksiel_2
        rating = tree.xpath('//figcaption[@class="we-rating-count star-rating__count"]/text()')[0] #inspeksiel_3
        price = tree.xpath('//li[@class="inline-list__item inline-list__item--bulleted app-header__list__item--price"]/text()')[0] #inspeksiel_4
        links = tree.xpath('//div[@class="l-row l-row--peek"]/a/@href') #inspeksielLink
        app = App(name,developer,rating,price,links)
        
        return app
```

Membuat class App, untuk mengembalikan (return) nilai / informasi data dari proses crawling

```python
class App:
    
    def __init__(self,name,developer,rating,price,links):
        self.name = name
        self.developer = developer
        self.rating = rating
        self.price = price
        self.links = links

    def __str__(self):
        nama = self.name.strip()
        dev = self.developer.strip()
        rate = self.rating.strip()
        hrg = self.price.strip()
        return (nama + ',' + dev + ',' +rate + ',' +hrg + ',' + '\n')

```

Menjalankan applikasi crawling dan menyimpan data dari proses crawling.

```python
crawler = AppCrawler("https://itunes.apple.com/us/app/candy-crush-saga/id553834731",1) #linkstartingURL
crawler.crawl() #startapp

#prose save data to .csv file
csvFilename="i2nes.csv"
csv=open(csvFilename,"w",encoding='utf-8')
colNames = "Name,Developer,Star,Rating,Price\n"
csv.write(colNames)

for app in crawler.apps:
    weni = str(app)
    print (weni) #print on idle
    csv.write(weni) #write on .csv

csv.close()
```



**Step 5 : Save to database**

Siapkan database dan file .csv kemudian ikuti langkah berikut :

1. create database
2. klik impor
3. upload file .csv
4. pilih format CSV
5. centang *the first line of the contains the table column names*
6. klik kirim

![csvsql](/csvsql.PNG)

![csvsql2](/csvsql2.PNG)



