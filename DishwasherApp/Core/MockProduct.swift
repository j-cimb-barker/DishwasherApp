//
//  MockProduct.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import Foundation

// Mock Product for UI Development / Testing
class MockProduct : Product {
    
    
    override init () {
        
        super.init()
        
        super.productId = "3215462"
        super.title = "Bosch SMS25AW00G Freestanding Dishwasher, White"
        
        super.price = "239.00"
        
        super.imageURL = URL.init(string: "https://johnlewis.scene7.com/is/image/JohnLewis/236888507?")
        
        super.images = [
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt1?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt10?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt2?",
        ]
        
        super.displaySpecialOffer = "Claim an extra 3 years gaurantee via Redemption\nSepcial Offer : £50 trade in until 15 Dec"
        
        super.guranteeStr = "2 year guarantee included"
        
        super.features = [
            
            Feature (jsonDict: [
                "id" : "attr10139380720",
                "name" : "Model name / number",
                "toolTip" : "",
                "uom" : "",
                "value" : "SMV40C30GB Fully Integrated Dishwasher"
            ]),
            Feature (jsonDict:[
                "id" : "attr10139380720",
                "name" : "Rinse Aid Indicator",
                "toolTip" : "",
                "uom" : "",
                "value" : "YES"
            ])
        ]
        
        super.productInfo = "<p>The Bosch SMV40C30GB built-in dishwasher features a range of programmes to choose from, and is rated A+ for energy efficiency so it’ll save you money on your bills and reduce your environmental impact. 12 place settings make it suitable for a family household, and a durable Polinox base will give it a long life.</p>"
        super.productInfo = super.productInfo + "<p><strong>4 programmes</strong><br />4 programmes to choose from allow you to easily wash your dishes with the most appropriate settings. These programmes include a quick wash programme which is ideal for when you need your dishes clean in a hurry.</p>"
        super.productInfo = super.productInfo + "<p><strong>Water efficient</strong><br />On a normal 65°C programme, the dishwasher will use just 11.8 litres of water. The AquaSensor measures the amount of soiling at the end of the pre-rinse. If the water is only lightly soiled, it will be re-used for the main wash.</p>"
        super.productInfo = super.productInfo + "<p><strong>Quiet</strong><br />At just 50dB, the SMV40C30GB has a low noise level, so once you’ve put your dishes in the wash you can enjoy the rest of your evening in peace. The lack of annoying background noise is especially handy if you’re entertaining guests.</p>"
        super.productInfo = super.productInfo + "<p><strong>VarioBaskets</strong><br />With VarioBaskets, you can enjoy a flexible storage space which can be customised to fit your kitchen items inside efficiently. This is handy for washing particularly large items.</p>"
        super.productInfo = super.productInfo + "<p><strong>InfoLight</strong><br />The InfoLight feature lets you know when the dishwasher is in use by projecting a dot of light onto the floor. This will prevent you from accidentally opening the door mid-cycle.</p>"
        super.productInfo = super.productInfo + "<p><strong>Please note:&nbsp;</strong>Although the depth of this model is 55cm, please allow 57cm for installation.</p>"
        
    }
    
}
