from raven import Client

client = Client('http://d15887e30b5b484ebf73ca30f6b61c5e:bad3446ce56e42a2b30fd959ef5b94c2@118.190.202.67:9000/3')

try:
    1 / 0
except ZeroDivisionError:
    client.captureException()