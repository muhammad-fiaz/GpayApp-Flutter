import 'dart:math';

import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Constants.dart';
import 'package:gpay/utils/Images.dart';
import 'package:gpay/utils/String.dart';

const sender_id = 1;
const receiver_id = 2;

List<GPPeopleModel> getPeopleData() {
  List<GPPeopleModel> mList = [];

  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Bob John"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Bob John"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Jerry"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Mohan Joe"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Antonio"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Elvina"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Sara"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Benjamin"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Bob"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Isabella"));
  mList.add(GPPeopleModel("images/cloneApp/gPay/gp_user.jpg", "Ria"));

  return mList;
}

List<GPBusinessTypeModel> getBusinessTypeData() {
  List<GPBusinessTypeModel> mList = [];
  mList.add(GPBusinessTypeModel(GP_img1, "Spots"));
  mList.add(GPBusinessTypeModel(GP_img2, "Essentials"));
  mList.add(GPBusinessTypeModel(GP_img3, "Shopping"));
  mList.add(GPBusinessTypeModel(GP_img4, "Local services"));
  mList.add(GPBusinessTypeModel(GP_img5, "Travel"));

  return mList;
}

List<GPPeopleModel> getBusinessData() {
  List<GPPeopleModel> mList = [];

  mList.add(GPPeopleModel(GP_img1, "GPay Business"));
  mList.add(GPPeopleModel(GP_img2, "GPay Business"));
  mList.add(GPPeopleModel(GP_img3, "GPay Business"));
  mList.add(GPPeopleModel(GP_img4, "GPay Business"));
  mList.add(GPPeopleModel(GP_img5, "GPay Business"));
  mList.add(GPPeopleModel(GP_img6, "GPay Business"));
  mList.add(GPPeopleModel(GP_img7, "GPay Business"));
  mList.add(GPPeopleModel(GP_img1, "GPay Business"));

  return mList;
}

List<GPPeopleModel> getPromotionsData() {
  List<GPPeopleModel> mList = [];

  mList.add(GPPeopleModel(GP_reward, "Rewards"));
  mList.add(GPPeopleModel(GP_offer, "Offers"));
  mList.add(GPPeopleModel(GP_referrals, "Referrals"));

  return mList;
}

List<GPContactModel> getContactData() {
  List<GPContactModel> mList = [];

  mList.add(GPContactModel(GPAY_user, "Bob John", "+91 9876543210"));
  mList.add(GPContactModel(GP_user1, "Elvina", "+91 1234567890"));
  mList.add(GPContactModel(GP_user2, "Jerry", "+91 123457895"));
  mList.add(GPContactModel(GP_user3, "Mohan", "+91 7234567820"));
  mList.add(GPContactModel(GP_user4, "Antonio", "+91 92345678743"));
  mList.add(GPContactModel(GP_user5, "Sara", "+91 92345678743"));
  mList.add(GPContactModel(GP_user6, "Benjamin", "+91 92345678743"));
  mList.add(GPContactModel(GP_user7, "Bob", "+91 92345678743"));
  mList.add(GPContactModel(GP_user8, "Isabella", "+91 92345678743"));
  mList.add(GPContactModel(GP_user9, "Benjamin", "+91 92345678743"));
  mList.add(GPContactModel(GP_user10, "Willam", "+91 92345678743"));

  return mList;
}

List<GPDthModel> getDthData() {
  List<GPDthModel> mList = [];

  mList.add(GPDthModel(GP_cable_tv, "DTH/ Cable TV"));
  mList.add(GPDthModel(GP_electricity, "Electricity"));
  mList.add(GPDthModel(GP_mobile, "Postpaid mobile"));
  mList.add(GPDthModel(GP_play_store, "Google Play"));
  mList.add(GPDthModel(GP_broadband, "Broadband/ Landline"));

  return mList;
}

List<GPDthDetailsModel> getDthDetailsData() {
  List<GPDthDetailsModel> mList = [];

  mList.add(GPDthDetailsModel(GP_img1, "GPay TV", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img2, "GPay TV", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img3, "GPay", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img4, "GPay", "Bill payments"));

  return mList;
}

List<GPDthDetailsModel> getElectricityDetailsData() {
  List<GPDthDetailsModel> mList = [];

  mList.add(GPDthDetailsModel(GP_img1, "GPay", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img2, "GPay", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img3, "GPay", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img4, "GPay", "Bill payments"));

  return mList;
}

List<GPDthDetailsModel> getPostPaidMobileData() {
  List<GPDthDetailsModel> mList = [];

  mList.add(GPDthDetailsModel(GP_img1, "GPay Postpaid Mobile", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img2, "GPay Postpaid Mobile", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img3, "GPay Postpaid Mobile", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img4, "GPay Postpaid", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img5, "GPay Postpaid Mobile", "Bill payments"));

  return mList;
}

List<GPDthDetailsModel> getPlayStoreData() {
  List<GPDthDetailsModel> mList = [];

  mList.add(GPDthDetailsModel(GP_img1, "GPay Store Recharge Code", "Bill payments"));

  return mList;
}

List<GPDthDetailsModel> getBroadBandData() {
  List<GPDthDetailsModel> mList = [];
  mList.add(GPDthDetailsModel(GP_img1, "GPay Broadband", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img2, "GPay Broadband", "Bill payments"));
  mList.add(GPDthDetailsModel(GP_img3, "GPay", "Bill payments"));
  return mList;
}

List<GPRechargeModel> getRechargeData() {
  List<GPRechargeModel> mList = [];
  mList.add(GPRechargeModel(GP_img1, "GPay Postpaid"));
  mList.add(GPRechargeModel(GP_img2, "GPay Postpaid"));
  mList.add(GPRechargeModel(GP_img3, "GPay Postpaid"));
  mList.add(GPRechargeModel(GP_img4, "GPay Postpaid"));
  mList.add(GPRechargeModel(GP_img5, "GPay Postpaid"));
  return mList;
}

List<GPRechargeForYouModel> getForYouRechargeData() {
  List<GPRechargeForYouModel> mList = [];
  mList.add(GPRechargeForYouModel("249", "Double Data Offer.Get Truly Unlimited Local/National Calls+1.5GB/D+Extra 1.5GB/D+100SMS/d.Val:28D"));
  mList.add(GPRechargeForYouModel("219", "Now Get Truly Unlimited Local/National Calls to all Networks +1GB/Day+100SMS/Day-Validity:28Days"));
  mList.add(GPRechargeForYouModel("399", "Double Data Offer.Get Truly Unlimited Local/National Calls+1.5GB/D+Extra 1.5GB/D+100SMS/d.Val:56D"));
  mList.add(GPRechargeForYouModel("599", "Double Data Offer.Get Truly Unlimited Local/National Calls+1.5GB/D+Extra 1.5GB/D+100SMS/d.Val:84D"));
  mList.add(GPRechargeForYouModel("16", "Get 1GB 4G/3G/2G Data-Validity:1 Day"));
  mList.add(GPRechargeForYouModel("48", "Get 1GB 4G/3G/2G Data-Validity:28 Day"));

  return mList;
}

List<GPRechargeDataModel> getRechargeDataModel() {
  List<GPRechargeDataModel> mList = [];
  mList.add(
    GPRechargeDataModel(
      "795",
      "84 days",
      "Now get 1 year ZEE5 Premium access. Also get 2GB/Day Data + Unlimited Calls+ 100SMS/day, valid for 84 Days. Now enjoy Weekend roll-over & binge on weekends with your Unused Data from Mon-Fri. Visit bit.ly/Vi-WDR to know more",
    ),
  );
  mList.add(GPRechargeDataModel("995", " 7 days", "Voice: Upto 150 mins OG and Ic + Data: Upto 500 MB + SMS: RS. 25/SMS"));
  mList.add(GPRechargeDataModel("1495", "7 days", "Voice: Upto 300 mins OG and Ic + Data: Upto 500 MB + SMS: RS. 25/SMS"));
  mList.add(GPRechargeDataModel("1499", "365 days", "Voice: Truly Unlimited + Data: 24 GB 4G/3G/2G Data + SMS: 3600 SMS"));
  mList.add(GPRechargeDataModel("2399", "365 days", "Now get Truly Unlimited Local/National Calls to all Networks + 1.5GB/Day + 100 Local and National SMS/Day. Pack Validity for 365 Days."));
  return mList;
}

List<GPTopUpRechargeModel> getTopUpRechargeModel() {
  List<GPTopUpRechargeModel> mList = [];
  mList.add(GPTopUpRechargeModel("1000", "847.46", "Talktime of Rs. 847.46,Talktime"));
  mList.add(GPTopUpRechargeModel("5000", "4,237.29", "Talktime of Rs. 4237.29,Talktime"));
  mList.add(GPTopUpRechargeModel("12", "10 days", "Talktime of Rs. 7.47, Talktime"));
  mList.add(GPTopUpRechargeModel("23", "28 days", "Talktime of Rs. 16, Talktime"));
  mList.add(GPTopUpRechargeModel("30", "28 days", "Talktime of Rs. 22.42, Talktime"));
  return mList;
}

List<GPRechargeDataModel> getOtherRechargeModel() {
  List<GPRechargeDataModel> mList = [];
  mList.add(GPRechargeDataModel("12", "10 days", "SMS: 120 SMS Local and National"));
  mList.add(GPRechargeDataModel("23", "28 days", "Voice: ISD Packs"));
  mList.add(GPRechargeDataModel("26", "28 days", "SMS: 250 SMS Local and National"));
  mList.add(GPRechargeDataModel("36", "28 days", "SMS: 350 SMS Local and National"));
  mList.add(GPRechargeDataModel("38", "60 days", "Voice: ISD Packs"));
  return mList;
}

List<GPPopularBusinessModel> getPopularBusinessModel() {
  List<GPPopularBusinessModel> mList = [];
  mList.add(GPPopularBusinessModel(GP_resort_img, 'Popular! Get 8 % off MakeMyTrip flights', "Save up to \u20B9 on your flight"));
  mList.add(GPPopularBusinessModel(GP_red_bus_travel, 'Save up to \u20B9300 on your 1s Redbus ticket', "Use code GPFIRST, now till Nov 30"));
  mList.add(GPPopularBusinessModel(Gp_gift_img, 'Get 20% off your first Dunzo order', "Sace up to \u20B9 100, now till Dec 31"));
  return mList;
}

List<GPBusinessSublistModel> getBusinessTravelList() {
  List<GPBusinessSublistModel> mList = [];
  mList.add(GPBusinessSublistModel(GP_img1, "GPay", "GPay", "Book Buses"));
  mList.add(GPBusinessSublistModel(GP_img1, "GPay", "Travel in India and aboard", "Book Travel"));
  return mList;
}

List<GPPopularBusinessModel> getFoodBusinessModel() {
  List<GPPopularBusinessModel> mList = [];
  mList.add(GPPopularBusinessModel(GP_food_img, 'Felling hungry? Discover restaurants here now!', "Zomato"));
  return mList;
}

List<GPBusinessSublistModel> getBusinessFoodList() {
  List<GPBusinessSublistModel> mList = [];
  mList.add(GPBusinessSublistModel(GP_img1, "GPay", "Tasty food delivered to you ", "Order food"));
  mList.add(GPBusinessSublistModel(GP_img2, "GPay", "Order your favorite burgers", "Order food"));
  return mList;
}

List<GPRewardAmountModel> getRewardAmount() {
  List<GPRewardAmountModel> mList = [];
  mList.add(GPRewardAmountModel(rewardAmount: "10", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "5", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "Better Luck", description: "next time"));
  mList.add(GPRewardAmountModel(rewardAmount: "Better Luck", description: "next time"));
  mList.add(GPRewardAmountModel(rewardAmount: "10", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "5", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "20", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "16", description: "You won"));
  mList.add(GPRewardAmountModel(rewardAmount: "Better Luck", description: "next time"));
  mList.add(GPRewardAmountModel(rewardAmount: "5", description: "You won"));

  return mList;
}

List<GPOfferModel> getOfferData() {
  List<GPOfferModel> mList = [];
  mList.add(GPOfferModel(GP_playstore_offer, "Earn up to \u20B9150", "On your first ever transactions of \u20B930 + on the $PSAppName"));
  mList.add(GPOfferModel(GP_youtube_offer, "Get up to 20B9399 on Youtube Premium", "Use $GPAYAppName to buy YouTube Premium 3-month plan and get up to  \u20B9399 as cashback"));
  mList.add(GPOfferModel(GP_electricity_offer, "Get \u20B920 to \u20B92000 on electricity bill pay..", "Make your 1st and 2st electricity bill payments ofe \u20B9"));
  mList.add(GPOfferModel(GP_visa_offer, "Get up to 20B9399 on Visa Premium", "On your first ever transactions of \u20B930 + on the Visa"));

  return mList;
}

List<GPAllTransactionsModel> getAllTransactionsData() {
  List<GPAllTransactionsModel> mList = [];
  mList.add(GPAllTransactionsModel(GP_user1, "Benjamin", '28 November', '- \u20B9500'));
  mList.add(GPAllTransactionsModel(GP_user3, "Mohan", '21 November', '+ \u20B920'));
  mList.add(GPAllTransactionsModel(GP_user2, "Jerry", '20 May', '- \u20B9700'));
  mList.add(GPAllTransactionsModel(GP_user8, "John", '31 March', '+ \u20B9690'));
  mList.add(GPAllTransactionsModel(GP_user4, "Bob John", '27 March', '- \u20B9 500'));
  mList.add(GPAllTransactionsModel(GP_user1, "Isabella", '26 March', '+ \u20B9 350'));
  mList.add(GPAllTransactionsModel(GP_user6, "Sara", '22 March', '- \u20B9 220'));
  mList.add(GPAllTransactionsModel(GP_user7, "Benjamin", '20 March', '+ \u20B9 800'));
  return mList;
}

List<GPChatModel> getChatData() {
  List<GPChatModel> list = [];

  GPChatModel c1 = GPChatModel();
  c1.name = 'Ria';
  c1.img = GPAY_user;
  c1.time = 'online';
  c1.lastMsg = LoremText;
  c1.unreadCount = Random().nextInt(20);
  c1.isActive = true;
  c1.phoneNumber = '+91 987932324410';
  list.add(c1);

  GPChatModel c2 = GPChatModel();
  c2.name = 'John';
  c2.img = GP_user1;
  c2.time = '5 min ago';
  c2.lastMsg = LoremText;
  c2.unreadCount = Random().nextInt(20);
  c2.isActive = true;
  c2.phoneNumber = '+91 98434343210';
  list.add(c2);

  GPChatModel c3 = GPChatModel();
  c3.name = 'Mohan';
  c3.img = GP_user2;
  c3.time = '15 min ago';
  c3.lastMsg = LoremText;
  c3.unreadCount = Random().nextInt(20);
  c3.isActive = true;
  c3.phoneNumber = '+91 934335410';
  list.add(c3);

  GPChatModel c4 = GPChatModel();
  c4.name = 'Sara';
  c4.img = GP_user3;
  c4.time = '20 min ago';
  c4.lastMsg = LoremText;
  c4.unreadCount = Random().nextInt(20);
  c4.isActive = true;
  c4.phoneNumber = '+91 974545453415';
  list.add(c4);

  GPChatModel c5 = GPChatModel();
  c5.name = 'Noyura';
  c5.img = GP_user4;
  c5.time = '30 min ago';
  c5.lastMsg = LoremText;
  c5.unreadCount = Random().nextInt(20);
  c5.isActive = true;
  c5.phoneNumber = '+91 87454545417';
  list.add(c5);

  GPChatModel c6 = GPChatModel();
  c6.name = 'Diya';
  c6.img = GP_user5;
  c6.time = '30 min ago';
  c6.lastMsg = LoremText;
  c6.unreadCount = Random().nextInt(20);
  c6.isActive = true;
  c6.phoneNumber = '+91 83834355417';
  list.add(c6);

  GPChatModel c7 = GPChatModel();
  c7.name = 'Neha';
  c7.img = GP_user6;
  c7.time = '36 min ago';
  c7.lastMsg = LoremText;
  c7.unreadCount = Random().nextInt(20);
  c7.isActive = true;
  c7.phoneNumber = '+91 86334343417';
  list.add(c7);

  GPChatModel c8 = GPChatModel();
  c8.name = 'Mohan';
  c8.img = GP_user7;
  c8.time = '80 min ago';
  c8.lastMsg = LoremText;
  c8.unreadCount = Random().nextInt(20);
  c8.isActive = true;
  c8.phoneNumber = '+91 87665646417';
  list.add(c8);

  GPChatModel c9 = GPChatModel();
  c9.name = 'Bob';
  c9.img = GP_user8;
  c9.time = '51 min ago';
  c9.lastMsg = LoremText;
  c9.unreadCount = Random().nextInt(20);
  c9.isActive = true;
  c9.phoneNumber = '+91 87434343418';
  list.add(c9);

  GPChatModel c10 = GPChatModel();
  c10.name = 'Judith';
  c10.img = GP_user9;
  c10.time = '30 min ago';
  c10.lastMsg = LoremText;
  c10.unreadCount = Random().nextInt(20);
  c10.isActive = true;
  c10.phoneNumber = '+91 878634343417';
  list.add(c10);

  GPChatModel c11 = GPChatModel();
  c11.name = 'Lora';
  c11.img = GP_user10;
  c11.time = '31 min ago';
  c11.lastMsg = LoremText;
  c11.unreadCount = Random().nextInt(20);
  c11.isActive = true;
  c11.phoneNumber = '+91 87867565417';
  list.add(c11);

  return list;
}

List<GPMessageModel> getChatMsgData() {
  List<GPMessageModel> list = [];

  GPMessageModel c1 = GPMessageModel();
  c1.senderId = sender_id;
  c1.receiverId = receiver_id;
  c1.msg = 'Hi';
  c1.time = '11:30 AM';
  list.add(c1);

  GPMessageModel c2 = GPMessageModel();
  c2.senderId = sender_id;
  c2.receiverId = receiver_id;
  c2.msg = 'Hello';
  c2.time = '11:30 AM';
  list.add(c2);

  GPMessageModel c3 = GPMessageModel();
  c3.senderId = receiver_id;
  c3.receiverId = sender_id;
  c3.msg = 'How are you?';
  c3.time = '11:30 AM';
  list.add(c3);

  GPMessageModel c4 = GPMessageModel();
  c4.senderId = sender_id;
  c4.receiverId = receiver_id;
  c4.msg = 'I am good. Good to hear';
  c4.time = '11:31 AM';
  list.add(c4);

  GPMessageModel c5 = GPMessageModel();
  c5.senderId = sender_id;
  c5.receiverId = receiver_id;
  c5.msg = 'I am good. I need your help.';
  c5.time = '11:31 AM';
  list.add(c5);

  GPMessageModel c6 = GPMessageModel();
  c6.senderId = receiver_id;
  c6.receiverId = sender_id;
  c6.msg = 'I am good.I need your help.';
  c6.time = '11:31 AM';
  list.add(c6);

  GPMessageModel c7 = GPMessageModel();
  c7.senderId = sender_id;
  c7.receiverId = receiver_id;
  c7.msg = 'I am good. I need your help.';
  c7.time = '11:31 AM';
  list.add(c7);

  GPMessageModel c8 = GPMessageModel();
  c8.senderId = receiver_id;
  c8.receiverId = sender_id;
  c8.msg = 'I am good. I need your help.';
  c8.time = '11:31 AM';
  list.add(c8);

  GPMessageModel c9 = GPMessageModel();
  c9.senderId = sender_id;
  c9.receiverId = receiver_id;
  c9.msg = 'I am good. I need your help.';
  c9.time = '11:31 AM';
  list.add(c9);

  GPMessageModel c10 = GPMessageModel();
  c10.senderId = receiver_id;
  c10.receiverId = sender_id;
  c10.msg = 'I am good. I need your help.';
  c10.time = '11:32 AM';
  list.add(c10);

  GPMessageModel c11 = GPMessageModel();
  c11.senderId = receiver_id;
  c11.receiverId = sender_id;
  c11.msg = 'I am good.I need your help.';
  c11.time = '11:31 AM';
  list.add(c11);

  GPMessageModel c12 = GPMessageModel();
  c12.senderId = sender_id;
  c12.receiverId = receiver_id;
  c12.msg = 'I am good. I need your help.';
  c12.time = '11:32 AM';
  list.add(c12);

  GPMessageModel c13 = GPMessageModel();
  c13.senderId = sender_id;
  c13.receiverId = receiver_id;
  c13.msg = 'I am good. Can you do something for me?.';
  c13.time = '11:32 AM';
  list.add(c13);

  GPMessageModel c14 = GPMessageModel();
  c14.senderId = receiver_id;
  c14.receiverId = sender_id;
  c14.msg = 'I am good.I need your help.';
  c14.time = '11:32 AM';
  list.add(c14);

  GPMessageModel c15 = GPMessageModel();
  c15.senderId = sender_id;
  c15.receiverId = receiver_id;
  c15.msg = 'I am good.I need your help.';
  c15.time = '11:32 AM';
  list.add(c15);

  GPMessageModel c16 = GPMessageModel();
  c16.senderId = receiver_id;
  c16.receiverId = sender_id;
  c16.msg = 'I am good.';
  c16.time = '10:32 AM';
  list.add(c16);

  GPMessageModel c17 = GPMessageModel();
  c17.senderId = sender_id;
  c17.receiverId = receiver_id;
  c17.msg = 'I am good.';
  c17.time = '10:32 AM';
  list.add(c17);

  GPMessageModel c18 = GPMessageModel();
  c18.senderId = receiver_id;
  c18.receiverId = sender_id;
  c18.msg = 'Can you do something for me?';
  c18.time = '10:30 AM';
  list.add(c18);

  return list;
}
