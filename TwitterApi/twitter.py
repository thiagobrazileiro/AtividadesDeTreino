from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
from datetime import datetime
from dotenv import load_dotenv
import json
import os

load_dotenv()

consumer_key = os.getenv('CONSUMER_KEY')
consumer_secret = os.getenv('CONSUMER_SECRET')
access_token = os.getenv('ACCESS_TOKEN')
access_token_secret = os.getenv('ACCESS_TOKEN_SECRET')
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

class MyListener(StreamListener):
    cont = 0
    def on_data(self, dados):
        # tweet = json.loads(dados)
        # created_at = tweet["created_at"]
        # id_str = tweet["id_str"]
        # text = tweet["text"]
        # obj = {"created_at":created_at,"id_str":id_str,"text":text,}
        self.cont += 1
        print (self.cont)
        return True

mylistener = MyListener()
mystream = Stream(auth, listener=mylistener)
keywords = ["hello world"]
mystream.filter(track=keywords)