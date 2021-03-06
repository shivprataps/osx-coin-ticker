//
//  TrackingUtils.swift
//  CoinTicker
//
//  Created by Alec Ananian on 7/23/17.
//  Copyright © 2017 Alec Ananian.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Cocoa
import Crashlytics

enum TrackedEvent: String {
    case selectExchange = "Select Exchange"
    case selectUpdateInterval = "Select Update Interval"
    case selectBaseCurrency = "Select Base Currency"
    case selectQuoteCurrency = "Select Quote Currency"
}

enum TrackedEventAttributes: String {
    case exchange = "Exchange"
    case updateInterval = "Update Interval"
    case currency = "Currency"
}

struct TrackingUtils {
    
    static func log(_ event: TrackedEvent, withAttributes attributes: [String: Any]?) {
        Answers.logCustomEvent(withName: event.rawValue, customAttributes: attributes)
    }
    
    static func didSelectExchange(_ exchange: ExchangeSite) {
        log(.selectExchange, withAttributes: [TrackedEventAttributes.exchange.rawValue: exchange.displayName])
    }
    
    static func didSelectUpdateInterval(_ updateInterval: Int) {
        log(.selectUpdateInterval, withAttributes: [TrackedEventAttributes.updateInterval.rawValue: updateInterval])
    }
    
    static func didSelectBaseCurrency(_ currency: Currency) {
        log(.selectBaseCurrency, withAttributes: [TrackedEventAttributes.currency.rawValue: currency.code])
    }
    
    static func didSelectQuoteCurrency(_ currency: Currency) {
        log(.selectQuoteCurrency, withAttributes: [TrackedEventAttributes.currency.rawValue: currency.code])
    }
    
}
