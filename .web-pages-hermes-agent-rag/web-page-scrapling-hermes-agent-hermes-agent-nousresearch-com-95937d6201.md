# Scrapling | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/research/research-scrapling
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/research/research-scrapling
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/research/research-scrapling
- Fetched at: 2026-06-23T14:20:46Z
- Content type: text/html; charset=utf-8

## Description

Web scraping with Scrapling - HTTP fetching, stealth browser automation, Cloudflare bypass, and spider crawling via CLI and Python

## Extracted Text

Skip to main content
On this page
Web scraping with Scrapling - HTTP fetching, stealth browser automation, Cloudflare bypass, and spider crawling via CLI and Python.
Skill metadata ​
Source Optional — install with hermes skills install official/research/scrapling Path optional-skills/research/scrapling Version 1.0.0 Author FEUAZUR License MIT Platforms linux, macos, windows Tags Web Scraping , Browser , Cloudflare , Stealth , Crawling , Spider Related skills duckduckgo-search , domain-intel
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
Scrapling
Scrapling is a web scraping framework with anti-bot bypass, stealth browser automation, and a spider framework. It provides three fetching strategies (HTTP, dynamic JS, stealth/Cloudflare) and a full CLI.
This skill is for educational and research purposes only. Users must comply with local/international data scraping laws and respect website Terms of Service.
When to Use ​
Scraping static HTML pages (faster than browser tools)
Scraping JS-rendered pages that need a real browser
Bypassing Cloudflare Turnstile or bot detection
Crawling multiple pages with a spider
When the built-in web_extract tool does not return the data you need
Installation ​
pip install "scrapling[all]"
scrapling install
Minimal install (HTTP only, no browser):
pip install scrapling
With browser automation only:
pip install "scrapling[fetchers]"
Quick Reference ​
Approach Class Use When HTTP Fetcher / FetcherSession Static pages, APIs, fast bulk requests Dynamic DynamicFetcher / DynamicSession JS-rendered content, SPAs Stealth StealthyFetcher / StealthySession Cloudflare, anti-bot protected sites Spider Spider Multi-page crawling with link following
CLI Usage ​
Extract Static Page ​
scrapling extract get 'https://example.com' output.md
With CSS selector and browser impersonation:
scrapling extract get 'https://example.com' output.md \
--css-selector '.content' \
--impersonate 'chrome'
Extract JS-Rendered Page ​
scrapling extract fetch 'https://example.com' output.md \
--css-selector '.dynamic-content' \
--disable-resources \
--network-idle
Extract Cloudflare-Protected Page ​
scrapling extract stealthy-fetch 'https://protected-site.com' output.html \
--solve-cloudflare \
--block-webrtc \
--hide-canvas
POST Request ​
scrapling extract post 'https://example.com/api' output.json \
--json '{"query": "search term"}'
Output Formats ​
The output format is determined by the file extension:
.html -- raw HTML
.md -- converted to Markdown
.txt -- plain text
.json / .jsonl -- JSON
Python: HTTP Scraping ​
Single Request ​
from scrapling . fetchers import Fetcher
page = Fetcher . get ( 'https://quotes.toscrape.com/' )
quotes = page . css ( '.quote .text::text' ) . getall ( )
for q in quotes :
print ( q )
Session (Persistent Cookies) ​
from scrapling . fetchers import FetcherSession
with FetcherSession ( impersonate = 'chrome' ) as session :
page = session . get ( 'https://example.com/' , stealthy_headers = True )
links = page . css ( 'a::attr(href)' ) . getall ( )
for link in links [ : 5 ] :
sub = session . get ( link )
print ( sub . css ( 'h1::text' ) . get ( ) )
POST / PUT / DELETE ​
page = Fetcher . post ( 'https://api.example.com/data' , json = { "key" : "value" } )
page = Fetcher . put ( 'https://api.example.com/item/1' , data = { "name" : "updated" } )
page = Fetcher . delete ( 'https://api.example.com/item/1' )
With Proxy ​
page = Fetcher . get ( 'https://example.com' , proxy = 'http://user:pass@proxy:8080' )
Python: Dynamic Pages (JS-Rendered) ​
For pages that require JavaScript execution (SPAs, lazy-loaded content):
from scrapling . fetchers import DynamicFetcher
page = DynamicFetcher . fetch ( 'https://example.com' , headless = True )
data = page . css ( '.js-loaded-content::text' ) . getall ( )
Wait for Specific Element ​
page = DynamicFetcher . fetch (
'https://example.com' ,
wait_selector = ( '.results' , 'visible' ) ,
network_idle = True ,
)
Disable Resources for Speed ​
Blocks fonts, images, media, stylesheets (~25% faster):
from scrapling . fetchers import DynamicSession
with DynamicSession ( headless = True , disable_resources = True , network_idle = True ) as session :
page = session . fetch ( 'https://example.com' )
items = page . css ( '.item::text' ) . getall ( )
Custom Page Automation ​
from playwright . sync_api import Page
def scroll_and_click ( page : Page ) :
page . mouse . wheel ( 0 , 3000 )
page . wait_for_timeout ( 1000 )
page . click ( 'button.load-more' )
page . wait_for_selector ( '.extra-results' )
page = DynamicFetcher . fetch ( 'https://example.com' , page_action = scroll_and_click )
results = page . css ( '.extra-results .item::text' ) . getall ( )
Python: Stealth Mode (Anti-Bot Bypass) ​
For Cloudflare-protected or heavily fingerprinted sites:
from scrapling . fetchers import StealthyFetcher
page = StealthyFetcher . fetch (
'https://protected-site.com' ,
headless = True ,
solve_cloudflare = True ,
block_webrtc = True ,
hide_canvas = True ,
content = page . css ( '.protected-content::text' ) . getall ( )
Stealth Session ​
from scrapling . fetchers import StealthySession
with StealthySession ( headless = True , solve_cloudflare = True ) as session :
page1 = session . fetch ( 'https://protected-site.com/page1' )
page2 = session . fetch ( 'https://protected-site.com/page2' )
Element Selection ​
All fetchers return a Selector object with these methods:
CSS Selectors ​
page . css ( 'h1::text' ) . get ( ) # First h1 text
page . css ( 'a::attr(href)' ) . getall ( ) # All link hrefs
page . css ( '.quote .text::text' ) . getall ( ) # Nested selection
XPath ​
page . xpath ( '//div[@class="content"]/text()' ) . getall ( )
page . xpath ( '//a/@href' ) . getall ( )
Find Methods ​
page . find_all ( 'div' , class_ = 'quote' ) # By tag + attribute
page . find_by_text ( 'Read more' , tag = 'a' ) # By text content
page . find_by_regex ( r'\$\d+\.\d{2}' ) # By regex pattern
Similar Elements ​
Find elements with similar structure (useful for product listings, etc.):
first_product = page . css ( '.product' ) [ 0 ]
all_similar = first_product . find_similar ( )
Navigation ​
el = page . css ( '.target' ) [ 0 ]
el . parent # Parent element
el . children # Child elements
el . next_sibling # Next sibling
el . prev_sibling # Previous sibling
Python: Spider Framework ​
For multi-page crawling with link following:
from scrapling . spiders import Spider , Request , Response
class QuotesSpider ( Spider ) :
name = "quotes"
start_urls = [ "https://quotes.toscrape.com/" ]
concurrent_requests = 10
download_delay = 1
async def parse ( self , response : Response ) :
for quote in response . css ( '.quote' ) :
yield {
"text" : quote . css ( '.text::text' ) . get ( ) ,
"author" : quote . css ( '.author::text' ) . get ( ) ,
"tags" : quote . css ( '.tag::text' ) . getall ( ) ,
}
next_page = response . css ( '.next a::attr(href)' ) . get ( )
if next_page :
yield response . follow ( next_page )
result = QuotesSpider ( ) . start ( )
print ( f"Scraped { len ( result . items ) } quotes" )
result . items . to_json ( "quotes.json" )
Multi-Session Spider ​
Route requests to different fetcher types:
from scrapling . fetchers import FetcherSession , AsyncStealthySession
class SmartSpider ( Spider ) :
name = "smart"
start_urls = [ "https://example.com/" ]
def configure_sessions ( self , manager ) :
manager . add ( "fast" , FetcherSession ( impersonate = "chrome" ) )
manager . add ( "stealth" , AsyncStealthySession ( headless = True ) , lazy = True )
for link in response . css ( 'a::attr(href)' ) . getall ( ) :
if "protected" in link :
yield Request ( link , sid = "stealth" )
else :
yield Request ( link , sid = "fast" , callback = self . parse )
Pause/Resume Crawling ​
spider = QuotesSpider ( crawldir = "./crawl_checkpoint" )
spider . start ( ) # Ctrl+C to pause, re-run to resume from checkpoint
Pitfalls ​
Browser install required : run scrapling install after pip install -- without it, DynamicFetcher and StealthyFetcher will fail
Timeouts : DynamicFetcher/StealthyFetcher timeout is in milliseconds (default 30000), Fetcher timeout is in seconds
Cloudflare bypass : solve_cloudflare=True adds 5-15 seconds to fetch time -- only enable when needed
Resource usage : StealthyFetcher runs a real browser -- limit concurrent usage
Legal : always check robots.txt and website ToS before scraping. This library is for educational and research purposes
Python version : requires Python 3.10+
Skill metadata
Reference: full SKILL.md
When to Use
Installation
Quick Reference
CLI Usage
Extract Static Page
Extract JS-Rendered Page
Extract Cloudflare-Protected Page
POST Request
Output Formats
Python: HTTP Scraping
Single Request
Session (Persistent Cookies)
POST / PUT / DELETE
With Proxy
Python: Dynamic Pages (JS-Rendered)
Wait for Specific Element
Disable Resources for Speed
Custom Page Automation
Python: Stealth Mode (Anti-Bot Bypass)
Stealth Session
Element Selection
CSS Selectors
XPath
Find Methods
Similar Elements
Navigation
Python: Spider Framework
Multi-Session Spider
Pause/Resume Crawling
Pitfalls
