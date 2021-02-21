import mysql.connector
import os
from bs4 import BeautifulSoup
import undetected_chromedriver as uc
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.common.proxy import Proxy, ProxyType
from selenium.webdriver.chrome.options import Options
from fake_useragent import UserAgent
from webdriver_manager.chrome import ChromeDriverManager
import re
import subprocess
from colorama import init
from colorama import Fore, Back, Style
init()

class DownloadFilmDetails():
    def __init__(self):
      self


    def getHosts(self):
      query = ("SELECT id, film_link, title FROM filman_films")
      cursor.execute(query)
      self.data = cursor.fetchall()

    def isInMainCollection(self, filmID):
      query = 'select filman_downloaded_films.id as id_Pobranego, filman_downloaded_films.title as title, filman_films.id as id_filmu, filman_downloaded_films.is_downloaded as Pobrany from filman_films right join filman_downloaded_films on filman_downloaded_films.film_id=filman_films.id where filman_films.id=%s'
      cursor.execute(query,(filmID,))
      return cursor.fetchall()

    def isInTemporaryCollection(self, name):
      query2 = 'select * from temporary where title Like %s'
      cursor.execute(query2,(name,))
      return cursor.fetchall()

    def isExist(self,filmID,name):

      result2 = self.isInTemporaryCollection(name)

      if len(result2) == 0:
        query3=("INSERT INTO temporary "
                      "(id, title) "
                      "VALUES (%s, %s)")
        cursor.execute(query3,(None, name,))
        connection.commit()
        print(Fore.RED + 'brakuje w bazie: ',name)

        return False
      else:
        print(Fore.RED + 'W bazie: ',name)
        return True

    def tryDownloadFilm(self, name, filmID, parameters ,specific_quality):

      # modyfikuje nazwę żeby nie miała odstępów itd w nazwie pliku
      name2 = name.split('/')
      name = name2[0].strip().replace(' ', '_').replace(':', '_').replace('-', '_')

      success = False
      index = 1

      # przechodzę po wszystkich wierszach słownika
      for host in parameters:

        dictionary = {}
        temp ='ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i {} -c copy D:\\Filmy\\test\\{}.{}'

        if success == True:
          return success
          break

        print()
        print(Fore.BLUE + 'link:' + parameters[host]['link'])
        print()

        if parameters[host]['link'].find('mixdrop.co') != -1:
          continue
        elif parameters[host]['link'].find('playtube.ws') != -1:
          continue
        elif parameters[host]['link'].find('upstream.to') != -1:
          continue
        elif parameters[host]['link'].find('dood.to') != -1:
          continue
        elif parameters[host]['link'].find('vidlox.me') != -1:
          continue
        elif parameters[host]['link'].find('userload.co') != -1:
          continue
        elif len(parameters[host]['link']) < 5:
          continue

        browser.set_page_load_timeout(20)
        try:
          browser.get(parameters[host]['link'])
        except:
          print()
          print('przechodze dalej nie da sie pobrac strony')
          print()
          continue

        if parameters[host]['quality'] == specific_quality and parameters[host]['lector'] == 'Lektor' or parameters[host]['lector'] == 'Dubbing':

          browser_log = browser.get_log('performance')
          browser_page = browser.page_source
          pattern = re.compile(r'https://.[^<{]*?.mp4')
          pattern2 = re.compile(r'https://.*master.m3u8')
          pattern3 = re.compile(r'(GET).*.m3u8|(sslStart).*.m3u8')
          extension_pattern_1 = re.compile(r'.*.m3u8')
          links_list = []
        else:
          continue

        for row in browser_log:
          res = pattern3.search(row['message'])
          if res != None:
            link = pattern2.search(res.group())

            if link != None:
              links_list.append(link.group())

        if len(links_list) > 0:
          dictionary[index] = {
            'links' : links_list,
            'lector' : parameters[host]['lector'],
            'quality' : parameters[host]['quality']
          }
          index += 1
        else:
          res = pattern.findall(str(browser_page))
          if len(res) > 0:
            dictionary[index] = {
              'links' : res,
              'lector' : parameters[host]['lector'],
              'quality' : parameters[host]['quality']
            }
        if len(dictionary) == 0:
          print()
          print('Pusty slownik')
          continue

        for row in dictionary.items():

          for link in row[1]['links']:
            print('Tytuł',name)
            print()
            print(Fore.WHITE + 'Jakość: ', row[1]['quality'], 'id filmu: ', filmID)
            print()
            print('link do filmu: ', link)
            print()

            res2 = extension_pattern_1.search(link)
            if res2 != None:
              extension_file = 'ts'
            else:
              extension_file = 'mp4'

            command = temp.format(link,name,extension_file)
            try:
              subprocess.check_call(command, shell=True)
            except subprocess.CalledProcessError as e:
              print(e.output)
            else:
              success = True
              print(Fore.GREEN + 'Dodano',name)
              return {
                'success' : success,
                'link' : parameters[host]['link']
              }
              # break

      return {
        'success' : False,
        'link' : None
      }
    def executeRows(self, parameters, name, filmID):

      # próbuję pobrać film
      success = self.tryDownloadFilm(name, filmID, parameters, 'Wysoka')
      if success['success'] == True:
        return [success, 'Wysoka']
      else:
        return [success, 'Brak']


    def insertResultToDatabase(self, filmID, success, name, quality, link):
      query2=("INSERT INTO filman_downloaded_films "
                  "(id, film_id, is_downloaded, title, quality, link) "
                  "VALUES (%s, %s, %s, %s, %s, %s)")
      cursor.execute(query2,(None, filmID, success, name, quality, link))
      connection.commit()

    def updateResultInDatabase(self,filmID):

      query3= ("UPDATE filman_downloaded_films "
                  "SET is_downloaded=1 "
                  "WHERE film_id=%s")
      cursor.execute(query3,(filmID,))
      connection.commit()

    def getLinks(self,link):

      browser.set_page_load_timeout(50)

      try:
        browser.get(link)
      except:
        return {}

      WebDriverWait(browser, 30).until(EC.presence_of_element_located((By.XPATH, "//td[@class='link-to-video']//a")))
      bs = BeautifulSoup(browser.page_source, "html.parser")
      table = browser.find_elements_by_xpath("//td[@class='link-to-video']//a")

      dictionary = {}
      try:
        frame_links = bs.find('table', {'id': 'links'}).find('tbody').find_all('tr')
        index=1

        for x in list(frame_links):

          all_td = x.find_all('td')
          if len(all_td) > 0:
            dictionary[index] = {
              'link': '',
              'lector': all_td[1].get_text().strip(),
              'quality': all_td[2].get_text().strip()
            }
            index += 1
          else:
            continue

        index = 1
        way = 0

        for el in table:
          browser.execute_script('arguments[0].click();', el)
          if way == 0:
            try:
              # print('pobieram 1 krok')
              link_to_film = WebDriverWait(browser,2).until(EC.presence_of_element_located((By.XPATH,"//div[@id='frame']//a")))
              dictionary[index]['link'] = link_to_film.get_attribute('href')
            except:
              way = 1

          if way == 1:
            try:
              link_to_film = WebDriverWait(browser,2).until(EC.presence_of_element_located((By.XPATH,"//div[@id='frame']//iframe")))
              dictionary[index]['link'] = link_to_film.get_attribute('src')
            except:
              way = 2
          index += 1
      except:
        frame_links = None
        
      return dictionary

    # wykonuje cały program
    def executeProgram(self):

      # przechodzę do kolejnych linków z filmami
      for row in self.data:

        # sprawdzam czy wpis istnieje w bazie temporary
        is_exist = self.isExist(row[0],row[2])

        # jeśli nie istnieje
        if is_exist == False:
          parameters = self.getLinks(row[1])
          print()
          print(Fore.GREEN + 'nazwa filmu: ',row[2])

          # wykonuje operacje na przekazanej encji
          res = self.executeRows(parameters,row[2],row[0])

          # sprawdzam czy został wpisany do bazy z filmami
          table_result = self.isInMainCollection(row[0])
          if len(table_result) == 0:
            print(Fore.RED + 'Wprowadzono do bazy: ',row[2])
            # wpisuje do bazy z filmami
            self.insertResultToDatabase(row[0], res[0]['success'], row[2], res[1], res[0]['link'])

          if len(table_result) > 0 and res[0]['success'] == True:
            self.updateResultInDatabase(row[0])

        parameters = None

connection=mysql.connector.connect(user='PanJan', password='1@!idkq()034', host='localhost', database='test')
cursor=connection.cursor()

options = Options()
ua = UserAgent()
user_agent = ua.random
options.add_argument(f'user-agent={user_agent}')
caps = DesiredCapabilities.CHROME
caps['goog:loggingPrefs'] = {'performance': 'ALL'}
browser = uc.Chrome(desired_capabilities=caps,chrome_options=options)


if __name__ == '__main__':
  detailed_films=DownloadFilmDetails()
  detailed_films.getHosts()
  detailed_films.executeProgram()

cursor.close()
connection.close()



