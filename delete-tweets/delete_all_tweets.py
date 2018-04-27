#!/usr/bin/env python
# -*- coding: utf-8 -*-

import tweepy

consumer_key = ""
consumer_secret = ""
access_key = ""
access_secret = ""

def oauth_login(consumer_key, consumer_secret):
    """Authenticate with twitter using OAuth"""
    
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth_url = auth.get_authorization_url()
    
    verify_code = raw_input("Authenticate at %s and then enter you verification code here > " % auth_url) 
    auth.get_access_token(verify_code)
    
    return tweepy.API(auth)

def batch_delete(api):
    print "You are about to Delete all tweets from the account @%s." % api.verify_credentials().screen_name
    print "Does this sound ok? There is no undo! Type yes to carry out this action."
    do_delete = raw_input("> ")
    if do_delete.lower() == 'yes':
        for status in tweepy.Cursor(api.user_timeline).items():
            try:
                api.destroy_status(status.id)
                print "Deleted:", status.id
            except:
                print "Failed to delete:", status.id

if __name__ == "__main__":
    #authorize twitter, initialize tweepy
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_key, access_secret)
    api = tweepy.API(auth)
    print "Authenticated as: %s" % api.me().screen_name
    
    batch_delete(api)
