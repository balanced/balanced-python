function createChargePermission () {
  var args = {};
  var inputs = $('#chargePermissionTable input').each(function(i, item) {
    args[item.id] = item.value;
  });
  var request = {};
  request.url = "charge_permission";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#charge_permission_id').val(data.sid);
    $('#operating_charge_permission_sid').val(data.sid);
  };
  $.ajax(request);
}

function findChargePermission () {
  var args = {};
  args.email_address = $('#email_address').val()
  var request = {};
  request.url = "charge_permission/find";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#find_charge_permission_results').html(data);
  };
  request.error = function() {
    $('#find_charge_permission_results').html('');
  };
  $.ajax(request);
}

function deactivateChargePermission () {
  var args = {};
  args.sid = $('#charge_permission_id').val()
  var request = {};
  request.url = "charge_permission/deactivate";
  request.type = "POST";
  request.data = $.param(args);
  $.ajax(request);
}

function startChargePermissionIFrame() {
  // invoke charge permission iframe
  var args = {
    success: chargePermissionSuccessCallback,
    error: chargePermissionErrorCallback,
    charge_permission_sid: $('#charge_permission_id').val(),
    server: $('#charge_permission_server').val(),
    name: $('#charge_permission_cardholder_name').val(),
    address_street: '',
    address_city: '',
    address_state: '',
    address_zip: '',
    poundroot_id: 'pound-pcp'
  };
  PoundPay.init(args);
}

function chargePermissionSuccessCallback() {
  $("#pound-pcp").hide();
  $('#chargePermissionComplete').show();
}

function chargePermissionErrorCallback() {
  $("#pound-pcp").hide();
  alert("an error occurred");
}

function createPayment () {
  var args = {};
  var inputs = $('#paymentsTable input').each(function(i, item) {
    args[item.id] = item.value;
  });
  var request = {};
  request.url = "payment";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#payment_id').val(data.sid);
    $('#operating_payment_sid').val(data.sid);
  };
  $.ajax(request);
}

function createUser () {
  var args = {};
  var inputs = $('#create_user_table input').each(function(i, item) {
    args[item.id] = item.value;
  });
  var request = {};
  request.url = "user";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#created_user_results').append(data);
  };
  $.ajax(request);
}

function authorizePayment () {
  var args = {};
  args.sid = $('#operating_payment_sid').val().split(' ')
  var request = {};
  request.url = "payment/authorize";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#operation_results').append(data);
  };
  $.ajax(request);
}

function escrowPayment () {
  var args = {};
  args.sid = $('#operating_payment_sid').val().split(' ')
  var request = {};
  request.url = "payment/escrow";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#operation_results').append(data);
  };
  $.ajax(request);
}

function releasePayment () {
  var args = {};
  args.sid = $('#operating_payment_sid').val()
  var request = {};
  request.url = "payment/release";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#operation_results').append(data);
  };
  $.ajax(request);
}

function cancelPayment () {
  var args = {};
  args.sid = $('#operating_payment_sid').val()
  var request = {};
  request.url = "payment/cancel";
  request.type = "POST";
  request.data = $.param(args);
  request.success = function(data) {
    $('#operation_results').append(data);
  };
  $.ajax(request);
}

function startIFrame() {
  payment_sids = $('#payment_id').val().split(' ');
  if (payment_sids.length == 0)
      payment_sids = null;
  else if (payment_sids.length == 1)
      payment_sids = payment_sids[0];

  // invoke Pound iframe
  var args = {
    success: paymentSuccessCallback,
    error: paymentErrorCallback,
    payment_sid: payment_sids,
    server: $('#server').val(),
    name: $('#cardholder_name').val(),
    address_street: '',
    address_city: '',
    address_state: '',
    address_zip: ''
  };
  PoundPay.init(args);
}


function launchLightbox() {

    var url = $('#server').val() + '/pmp/mobile?redirect_uri=' + '/' + '&payment_sid=' + $('#payment_id').val();

        var iframe = document.createElement('iframe');
        iframe.id = "pound-mobile-iframe";
        iframe.width = 340;
        iframe.height = 740;
        iframe.scrolling = "yes";
        iframe.setAttribute("allowTransparency", "true");
        iframe.setAttribute("frameBorder", "0");
        iframe.style.display = 'block';

        // insert iframe
        var poundroot_id = 'pound-root';
        var poundroot = document.getElementById(poundroot_id);
        poundroot.appendChild(iframe);

        // set src after it's in the page for ie6
        iframe.src = url;
}

function paymentSuccessCallback() {
  $("#pound-root").hide();
  $('#paymentComplete').show();
}

function paymentErrorCallback() {
  $("#pound-root").hide();
  alert("an error occurred");
}
