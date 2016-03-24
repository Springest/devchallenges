This project is **no longer maintained**.

If you're interested in taking it over, we'd love to hear from you.
Email [developers@springest.com](mailto:developers@springest.com), or check out
one of its maintained forks.

*****

# Springest Dev Trials

## Setup

Create apps on Github, Twitter, LinkedIn and set the following env vars:

```
export GITHUB_DEVTRIAL_APP_ID='key'
export GITHUB_DEVTRIAL_APP_SECRET='secret'
export TWITTER_DEVTRIAL_APP_ID='key'
export TWITTER_DEVTRIAL_APP_SECRET='secret'
export LI_DEVTRIAL_APP_ID='key'
export LI_DEVTRIAL_APP_SECRET='secret'
```

Make sure your Twitter app has read and write access. Your LI app should
be able to see full profile and email addresses if you want to be able
to contact candidates.

Create a GMail/Google Apps account (or use your own) and set the following env vars:

```
export DEVTRIAL_EMAIL='your@email.com'
export DEVTRIAL_EMAIL_PASSWORD='verysecret'
export DEVTRIAL_EMAIL_DOMAIN='email.com'
```

## Credits to

- [Kam Low](https://plus.google.com/+KamLow) for his excellent article
  on configuring [Omniauth for Rails 4](http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/).
- [Allen Fair](http://girders.org) for his easy setup guide for [Rails
  4, RSpec, and Guard with Spring](http://girders.org/blog/2014/02/06/setup-rails-41-spring-rspec-and-guard/)
