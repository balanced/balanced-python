% if mode == 'definition':
balanced.CardHold.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card_hold = balanced.CardHold.fetch('/card_holds/HL3iJ3toXGtGHwOyVMD9aT71')
% endif