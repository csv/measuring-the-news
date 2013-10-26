Calculate some NLP features from Text
=================================                                                

## Requirements:
```
nltk
nltk_contrib
```

## How to run
```
python text_features articles.json
```

where `articles.json` is formatted like this:
```
[
  {
    'url': 'http://...',
    'content': 'lorem ispum...'
  },
  {
    'url': 'http://...',
    'content': 'lorem ispum...'
  }
]
```

## About `lexicons/`

This folder contains some word lists and lexicons. `liwc-lexicon.json` is from here: [http://www.liwc.net/](http://www.liwc.net/)


