% if mode == 'definition':
balanced.Credit.find()
% else:
import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


credit = balanced.Credit.find('/v1/marketplaces/TEST-MP5xnSCw6SffAgT7r9dYSGeP/credits/CR6m6xbfRswklzk2LNPfuPgs')
% endif