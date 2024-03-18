class GPPeopleModel {
  var userImg;
  var userName;

  GPPeopleModel(this.userImg, this.userName);
}

class GPBusinessTypeModel {
  var businessImg;
  var businessName;

  GPBusinessTypeModel(this.businessImg, this.businessName);
}

class GPContactModel {
  var userImg;
  var userName;
  var userPhoneNumber;

  GPContactModel(this.userImg, this.userName, this.userPhoneNumber);
}

class GPDthModel {
  var dthImg;
  var dthName;

  GPDthModel(this.dthImg, this.dthName);
}

class GPDthDetailsModel {
  var img;
  var name;
  var title;

  GPDthDetailsModel(this.img, this.name, this.title);
}

class GPRechargeModel {
  var img;
  var name;

  GPRechargeModel(this.img, this.name);
}

class GPRechargeForYouModel {
  var rechargeAmount;
  var offer;

  GPRechargeForYouModel(this.rechargeAmount, this.offer);
}

class GPRechargeDataModel {
  var rechargeAmount;
  var validity;
  var offers;

  GPRechargeDataModel(this.rechargeAmount, this.validity, this.offers);
}

class GPTopUpRechargeModel {
  var amount;
  var validity;
  var offer;

  GPTopUpRechargeModel(this.amount, this.validity, this.offer);
}

class GPPopularBusinessModel {
  var image;
  var title;
  var offer;

  GPPopularBusinessModel(this.image, this.title, this.offer);
}

class GPBusinessSublistModel {
  var image;
  var name;
  var description;
  var buttonTitle;

  GPBusinessSublistModel(this.image, this.name, this.description, this.buttonTitle);
}

class GPRewardAmountModel {
  String? rewardAmount;
  var description;
  bool isScratch;

  GPRewardAmountModel({this.rewardAmount, this.description, this.isScratch = false});
}

class GPOfferModel {
  var img;
  var earnAmount;
  var description;

  GPOfferModel(this.img, this.earnAmount, this.description);
}

class GPAllTransactionsModel {
  var img;
  var name;
  var date;
  var amount;

  GPAllTransactionsModel(this.img, this.name, this.date, this.amount);
}

class GPChatModel {
  var name;
  var img;
  var lastMsg;
  var time;
  int? unreadCount;
  var phoneNumber;
  bool? isActive;

  GPChatModel({this.name, this.img, this.lastMsg, this.time, this.unreadCount, this.phoneNumber, this.isActive});
}

class GPMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  GPMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
