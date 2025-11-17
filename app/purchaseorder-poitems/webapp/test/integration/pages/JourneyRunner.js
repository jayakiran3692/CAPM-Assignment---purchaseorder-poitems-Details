sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/purchaseorder/purchaseorderpoitems/test/integration/pages/purchaseorderList",
	"com/ust/purchaseorder/purchaseorderpoitems/test/integration/pages/purchaseorderObjectPage",
	"com/ust/purchaseorder/purchaseorderpoitems/test/integration/pages/poitemsObjectPage"
], function (JourneyRunner, purchaseorderList, purchaseorderObjectPage, poitemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/purchaseorder/purchaseorderpoitems') + '/test/flp.html#app-preview',
        pages: {
			onThepurchaseorderList: purchaseorderList,
			onThepurchaseorderObjectPage: purchaseorderObjectPage,
			onThepoitemsObjectPage: poitemsObjectPage
        },
        async: true
    });

    return runner;
});

