#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YLPClient+Business.h"
#import "YLPClient+PhoneSearch.h"
#import "YLPClient+Search.h"
#import "YLPClient.h"
#import "YLPCoordinate.h"
#import "YLPGeoBoundingBox.h"
#import "YLPGeoCoordinate.h"
#import "YLPQuery.h"
#import "YLPSortType.h"
#import "YLPBusiness.h"
#import "YLPCategory.h"
#import "YLPCoordinateDelta.h"
#import "YLPDeal.h"
#import "YLPDealOption.h"
#import "YLPGiftCertificate.h"
#import "YLPGiftCertificateOption.h"
#import "YLPLocation.h"
#import "YLPPhoneSearch.h"
#import "YLPRegion.h"
#import "YLPReview.h"
#import "YLPSearch.h"
#import "YLPUser.h"
#import "YelpAPI.h"

FOUNDATION_EXPORT double YelpAPIVersionNumber;
FOUNDATION_EXPORT const unsigned char YelpAPIVersionString[];

