import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

key = balanced.APIKey.fetch('/api_keys/AK19Ap0xmiz0Oau3K4keBuwg')
key.delete()