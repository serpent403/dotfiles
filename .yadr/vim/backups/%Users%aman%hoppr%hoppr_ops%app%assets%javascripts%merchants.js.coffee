Vim�UnDo� �pcs�uCGJ]�h�i�4�m�$E�T,/}   L                 
       
   
   
    Rf�    _�                     C       ����                                                                                                                                                                                                                                                                                                                                                             Re�     �   D   F   K        �   B   F   I        )5�_�                    E       ����                                                                                                                                                                                                                                                                                                                                                             Re�     �   D   F   K        merchant_owner_id5�_�                    E       ����                                                                                                                                                                                                                                                                                                                                                             Re�     �   D   F   K      4  $("#merchant_owner_id").trigger("chosen:updated");5�_�                    D        ����                                                                                                                                                                                                                                                                                                                                                             Re�     �   C   D           5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                             Re�     �   7   9   K        �   6   9   J        )5�_�                    8       ����                                                                                                                                                                                                                                                                                                                                                             Re�    �   7   9   K      4  $("#merchant_owner_id").trigger("chosen:updated");5�_�                    E   '    ����                                                                                                                                                                                                                                                                                                                            E          E   &       v   &    Rel�     �   D   F   K      (  $(selector).trigger("chosen:updated");5�_�      	              8   '    ����                                                                                                                                                                                                                                                                                                                            E          E   &       v   &    Rel�     �   7   9   K      (  $(selector).trigger("chosen:updated");5�_�      
           	   K       ����                                                                                                                                                                                                                                                                                                                            E          E   &       v   &    Rel�    �   K                �   J                )5�_�   	               
           ����                                                                                                                                                                                                                                                                                                                                                             Rf�    �               L   L# Place all the behaviors and hooks related to the matching controller here.   C# All this logic will automatically be available in application.js.   A# You can use CoffeeScript in this file: http://coffeescript.org/           $ ->     $("select").on().chosen()   0  $('#merchant_role').on("change", fetch_owners)   4  $('#merchant_owner_id').on("change", fetch_places)       fetch_owners = () ->     role = $(this).val()   (  clear_select('#merchant_owner_id', "")   )  clear_select('#merchant_outlet_id', "")         console.log(role)   ?  return if (role == 'owner') || (role == "") || (role == null)       
  $.ajax({   !    url: '/ops/merchants/owners',       type: "GET",       dataType: 'json',       complete: (data) ->         res = data.responseJSON         return if res == null   9      populate_merchant_owners('#merchant_owner_id', res)     })       fetch_places = () ->     owner_id = $(this).val()   )  clear_select('#merchant_outlet_id', "")       2  return if (owner_id == "") || (owner_id == null)       
  $.ajax({   2    url: '/ops/merchants/' + owner_id + '/places',       type: "GET",       dataType: 'json',       complete: (data) ->         res = data.responseJSON         return if res == null   :      populate_merchant_places('#merchant_outlet_id', res)     })       /populate_merchant_owners = (selector, items) ->     console.log(items)       (  clear_select(selector, "Select Owner")         $.each(items, (i, item) ->   &    $(selector).append($('<option>', {           value: item._id,           text : item.name       }))     )   '  $(selector).trigger("chosen:updated")       /populate_merchant_places = (selector, items) ->     console.log(items)       )  clear_select(selector, "Select Outlet")         $.each(items, (i, item) ->   &    $(selector).append($('<option>', {           value: item.id,           text : item.name       }))     )   '  $(selector).trigger("chosen:updated")       "clear_select = (selector, text) ->     $(selector).empty()     $(selector).append(   ,    $('<option>', { value: "", text: text })     )   '  $(selector).trigger("chosen:updated")5��