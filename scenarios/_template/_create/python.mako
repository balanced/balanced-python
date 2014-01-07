% if mode == 'definition':
    balanced.RESOURCE().save()
% else:
    import balanced

    balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

    VARIABLE = balanced.RESOURCE()
    VARIABLE.save()
% endif
