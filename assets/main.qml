/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
import bb.data 1.0
import "pages/"

TabbedPane {
    showTabsOnActionBar: false
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Tab 1") + Retranslate.onLocaleOrLanguageChanged
        ChallengePage {
            
        }
    } //End of first tab
    Tab { //Second tab
        title: "Билеты" + Retranslate.onLocaleOrLanguageChanged
        
        attachedObjects: [
            DataSource {
                id: ticketDataSource
                source: "asset:///resources/tickets.json"
                onDataLoaded: {
                    //var itemIndex = 1;
                    //var itemIndex = 2;
                    //var itemIndex = 3;
                    var itemIndex = Math.floor(Math.random() * data.length);
                    var item = data[itemIndex];
                    ticketPage.ticket = item;
                }
            }
        ]
        TicketPage {
            id: ticketPage
            onCreationCompleted: {
                ticketDataSource.load();
                
            }
        }
    } //End of second tab
}
