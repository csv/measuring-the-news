Reduced NYT Data
================

Data Dictionary:
```
url : the url of the article
ext_buzz : shares on buzz
ext_delicious : shares on delicio.us
ext_diggs : shares on digg
ext_fb_clicks : clicks on facebook
ext_fb_comments : comments on facebook
ext_fb_comments_box : clicks on facebook comments box
ext_fb_likes : likes on facebook
ext_fb_shares : shares on facebook
ext_fb_total : total facebook activity
ext_google_plus_ones : shares on google plus
ext_linked_in : shares on linkedin
ext_pinterest : shares on pinterest
ext_reddit : shares on reddit
ext_stumble_upon : shares on stumble upon
ext_twitter : shares on twitter
avg_graf_length : average length of paragraphs in the article
avg_sentence_length : average length of sentences in the article
avg_word_length : average length of words in the article
avg_word_syllables : average number of syllables in words in article
bias_word_count : number of words in the article that indicate 'bias'
length_of_first_graf : length the article's first paragraph
coleman_liau_readability : the coleman liau readability score of the article
content_type : article, slideshow, video, or interactive graphics
excl_count : number of exclamation points in the article
flesh_readability : the flesh readability score of the artilce
ger_per : the percentage of words in the article that are gerrunds
is_in_paper : was the article in the physical paper?
is_page_one : was the article on the first page of the physical paper?
is_ap : is the article from the AP?
is_reuters : is the article from reuters ?
liwc_neg : number of negative words in the article, according to LIWC
liwc_pos : number of positive words in the article, according to LIWC
liwc_quant : number of quantitative words in the article, according to LIWC
liwc_sexual : number of sexual words in the article, according to LIWC
neg_word_count : number of negative words, according to http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
number_of_grafs : number of paragraphs in the artilce
pos_word_count : number of positive words, according to http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
pub_datetime : the date/time the article was published
pub_hour : the hour the article was published
pub_wkdy : the wkdy the article was published
pub_wknd : was the article published on the weekend?
ques_count : the number of question marks in the article
quote_count : the number of quotation marks in the article
section : the article's section
sentence_count : the number of sentences in the article
smog_readability : the article's smog readability score
word_count : the number of words in the article
n_section_fronts : the number of section fronts the article appeared on
n_section_front_links : the number of links on all section fronts the article appeared on
time_on_hp: the time (in minutes) the article appeared on the homepage
max_hp_rank : the max rank the article reached on the homepage
nyt_fb_page_likes : the number of likes for the facebook pages that posted the article
nyt_fb_page_talking_about : the number of people talking about the facebook pages that posted the article
fb_posts : the number of NYT facebook posts the article recieved
nyt_twt_followers : the number of twitter followers the article reached
nyt_twt_tweets : the number of NYT tweets the article recieved
nyt_twt_accounts : the (pipe-separated) NYT-twitter accounts that tweeted the article
desk : the desk that published the article
pageviews : the number of pageviews the article recieved over 7 days after publication
max_min_since_pub : the difference (in minutes) between when the article was published and when it last appeared in the data
nyt_social_media : the sum of NYT tweets and facebook posts
pub_date : the date the article was published
is_wire : was the article a AP or Reuters
nyt_main : was the article tweeted by the Main New York Times twitter account

## Section and Content Type Binaries
- useful for modeling purposes

is_arts
is_booming
is_business
is_fashion
is_garden
is_greathomesanddestinations
is_health
is_nyregion
is_opinion
is_pageoneplus
is_science
is_sports
is_travel
is_us
is_world
is_books
is_dining
is_education
is_movies
is_technology
is_theater
is_crosswords
is_your_money
is_automobiles
is_jobs
is_magazine
is_public_editor
is_realestate
is_sunday_review
is_learning
is_t_magazine
is_multimedia
is_obituaries
is_article
is_interactivegraphics
is_imageslideshow
is_video
```