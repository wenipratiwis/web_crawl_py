from lxml import html
import requests

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

        name = tree.xpath('//h1[@class="product-header__title app-header__title"]/text()')[0]
        developer = tree.xpath('//h2/a[@class="link"]/text()')[0]
        rating = tree.xpath('//figcaption[@class="we-rating-count star-rating__count"]/text()')[0]
        price = tree.xpath('//li[@class="inline-list__item inline-list__item--bulleted app-header__list__item--price"]/text()')[0]
        links = tree.xpath('//div[@class="l-row l-row--peek"]/a/@href')
        app = App(name,developer,rating,price,links)
        
        return app

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
    

crawler = AppCrawler("https://itunes.apple.com/us/app/candy-crush-saga/id553834731",1)
crawler.crawl()

csvFilename="i2nes.csv"
csv=open(csvFilename,"w",encoding='utf-8')
colNames = "Name,Developer,Star,Rating,Price\n"
csv.write(colNames)

for app in crawler.apps:
    weni = str(app)
    print (weni)
    csv.write(weni)

csv.close()
