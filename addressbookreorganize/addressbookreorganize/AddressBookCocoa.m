/*
 *
 *   File: AddressBookCocoa.m
 *
 *   Abstract: Shows how to create, access, add, search, and retrieve Address Book records.
 *
 *   Version: <1.1>
 *
 *   Disclaimer: IMPORTANT:  This Apple software is supplied to you by
 *   Apple Inc. ("Apple") in consideration of your agreement to the
 *   following terms, and your use, installation, modification or
 *   redistribution of this Apple software constitutes acceptance of these
 *   terms.  If you do not agree with these terms, please do not use,
 *   install, modify or redistribute this Apple software.
 *
 *   In consideration of your agreement to abide by the following terms, and
 *   subject to these terms, Apple grants you a personal, non-exclusive
 *   license, under Apple's copyrights in this original Apple software (the
 *   "Apple Software"), to use, reproduce, modify and redistribute the Apple
 *   Software, with or without modifications, in source and/or binary forms;
 *   provided that if you redistribute the Apple Software in its entirety and
 *   without modifications, you must retain this notice and the following
 *   text and disclaimers in all such redistributions of the Apple Software.
 *   Neither the name, trademarks, service marks or logos of Apple Inc.
 *   may be used to endorse or promote products derived from the Apple
 *   Software without specific prior written permission from Apple.  Except
 *   as expressly stated in this notice, no other rights or licenses, express
 *   or implied, are granted by Apple herein, including but not limited to
 *   any patent rights that may be infringed by your derivative works or by
 *   other works in which the Apple Software may be incorporated.
 *
 *   The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 *   MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 *   THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 *   FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 *   OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 *
 *   IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 *   OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *   INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 *   MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 *   AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 *   STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 *   POSSIBILITY OF SUCH DAMAGE.
 *
 *   Copyright (C) 2002-2010 Apple Inc. All Rights Reserved.
 *
 */

#import <AddressBook/AddressBook.h>
#import "AddressBookCocoa.h"

@implementation MyObject
Boolean FindFirstMatch(ABMutableMultiValue *multiValue, NSString *label, int *index);

#pragma mark Add contact
// Creates a record and adds it to Address Book
- (IBAction)addElba:(id)sender
{
    NSMutableDictionary *homeAddr, *workAddr;
    ABMutableMultiValue *multiValue;

    // Get the address book - there is only one.
    ABAddressBook *ab = [ABAddressBook sharedAddressBook];

    // Create a record.
    ABPerson *person = [[ABPerson alloc] init];

    // Set value in record for first name property.
    [person setValue:@"Able" forProperty:kABFirstNameProperty];

    // Set value in record for last name property.
    [person setValue:@"Elba" forProperty:kABLastNameProperty];

    // kABAddressProperty is a multiValue.
    // It's values, such as kABAddressHomeLabel, have in turn keys,
    // such as kABAddressStreetKey.
    // Create and populate a NSDictionary with some kABAddressHomeLabel keys.
    homeAddr = [NSMutableDictionary dictionary];
    [homeAddr setObject:@"123 Home Dr." forKey:kABAddressStreetKey];
    [homeAddr setObject:@"Home City" forKey:kABAddressCityKey];
    [homeAddr setObject:@"CA" forKey:kABAddressStateKey];
    [homeAddr setObject:@"94110" forKey:kABAddressZIPKey];
    [homeAddr setObject:@"United States" forKey:kABAddressCountryKey];

    // Create and populate a NSDictionary with some kABAddressWorkLabel keys.
    workAddr = [NSMutableDictionary dictionary];
    [workAddr setObject:@"123 Work Dr." forKey:kABAddressStreetKey];
    [workAddr setObject:@"Work City" forKey:kABAddressCityKey];
    [workAddr setObject:@"CA" forKey:kABAddressStateKey];
    [workAddr setObject:@"94110" forKey:kABAddressZIPKey];
    [workAddr setObject:@"United States" forKey:kABAddressCountryKey];

    // Create an ABMultivalue and add the kABAddressHomeLabel and
    // kABAddressWorkLabel NSDictionaries
    multiValue = [[ABMutableMultiValue alloc] init];
    [multiValue addValue:homeAddr withLabel:kABAddressHomeLabel];
    [multiValue addValue:workAddr withLabel:kABAddressWorkLabel];

    // Set value in record for kABAddressProperty.
    [person setValue:multiValue forProperty:kABAddressProperty];

    // [multiValue release];

    // kABPhoneProperty is a multivalue.
    // Create and populate a multiValue.
    multiValue = [[ABMutableMultiValue alloc] init];
    [multiValue addValue:@"408-974-0000" withLabel:kABPhoneWorkLabel];
    [multiValue addValue:@"408-974-1111" withLabel:kABPhoneHomeLabel];
    [multiValue addValue:@"408-974-2222" withLabel:kABPhoneMobileLabel];
    [multiValue addValue:@"408-974-3333" withLabel:kABPhoneMainLabel];
    [multiValue addValue:@"408-974-4444" withLabel:kABPhoneHomeFAXLabel];
    [multiValue addValue:@"408-974-5555" withLabel:kABPhoneWorkFAXLabel];
    [multiValue addValue:@"408-974-6666" withLabel:kABPhonePagerLabel];
    [multiValue addValue:@"408-974-7777" withLabel:kABOtherLabel];

    // Set value in record for kABPhoneProperty.
    [person setValue:multiValue forProperty:kABPhoneProperty];

    //  [multiValue release];

    // kABEmailProperty is a multivalue,kABEmailWorkLabel, kABEmailHomeLabel,kABOtherLabel
    // Create and populate a multiValue.
    multiValue = [[ABMutableMultiValue alloc] init];
    [multiValue addValue:@"work@qq.com" withLabel:kABEmailWorkLabel];
    [multiValue addValue:@"home@qq.com" withLabel:kABEmailHomeLabel];
    [multiValue addValue:@"other@qq.com" withLabel:kABOtherLabel];

    // Set value in record for kABPhoneProperty.
    [person setValue:multiValue forProperty:kABEmailProperty];

    //  [multiValue release];

    // Add record to the Address Book
    if ([ab addRecord:person]) {
        // Save the Address Book
        if ([ab save]) {
            printf("success");
        }
    }

    // [person release];
}

#pragma mark Search for contact
// Finds and displays a record from Address Book
- (IBAction)findElba:(id)sender
{
    ABMutableMultiValue *multiValueEmail;
    ABMutableMultiValue *multiValuePhone;
    NSArray             *results;
    ABRecord            *person;
    int                 index = 0;

    // Get the address book; there is only one.
    ABAddressBook *ab = [ABAddressBook sharedAddressBook];

    // find all contacts
    // results = [ab people];

    ABSearchElement *find;

    // Create a search element
    find = [ABPerson    searchElementForProperty:kABLastNameProperty
                        label                   :nil
                        key                     :nil
                        value                   :@"Elba"
                        comparison              :kABEqual];

    // Run a search
    results = [ab recordsMatchingSearchElement:find];

    // How many records matched?
    if ([results count] > 0) {
        // Fill in the matching records UI
        [matchingRecords setIntValue:[results count]];

        // Get the first record
        person = [results objectAtIndex:0];

        // Get   the kABFirstNameProperty and kABLastNameProperty
        [firstName setStringValue:[NSString stringWithFormat:@"first=%@;last=%@",

                [person valueForProperty:kABFirstNameProperty], [person valueForProperty:kABLastNameProperty]]];

        // get kABEmailProperty kABEmailWorkLabel, kABEmailHomeLabel,kABOtherLabel;

        multiValueEmail = [person valueForProperty:kABEmailProperty];
        NSString    *emailkABEmailWorkLabel;
        NSString    *emailkABEmailHomeLabel;
        NSString    *emailkABOtherLabel;

        if (FindFirstMatch(multiValueEmail, kABEmailWorkLabel, &index)) {
            emailkABEmailWorkLabel = [multiValueEmail valueAtIndex:index];
        }

        if (FindFirstMatch(multiValueEmail, kABEmailHomeLabel, &index)) {
            emailkABEmailHomeLabel = [multiValueEmail valueAtIndex:index];
        }

        if (FindFirstMatch(multiValueEmail, kABOtherLabel, &index)) {
            emailkABOtherLabel = [multiValueEmail valueAtIndex:index];
        }

        [emailAddr setStringValue:[NSString stringWithFormat:@"work=%@;home=%@;other=%@",

                emailkABEmailWorkLabel, emailkABEmailHomeLabel, emailkABOtherLabel]];

        // Get kABPhoneProperty

        multiValuePhone = [person valueForProperty:kABPhoneProperty];
        NSString    *phoneABPhoneWorkLabel;
        NSString    *phonekABPhoneHomeLabel;
        NSString    *phonekABPhoneMobileLabel;
        NSString    *phonekABPhoneMainLabel;
        NSString    *phonekABPhoneHomeFAXLabel;
        NSString    *phonekABPhoneWorkFAXLabel;
        NSString    *phonekABPhonePagerLabel;
        NSString    *phonekABOtherLabel;

        if (FindFirstMatch(multiValuePhone, kABPhoneWorkLabel, &index)) {
            phoneABPhoneWorkLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhoneHomeLabel, &index)) {
            phonekABPhoneHomeLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhoneMobileLabel, &index)) {
            phonekABPhoneMobileLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhoneMainLabel, &index)) {
            phonekABPhoneMainLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhoneHomeFAXLabel, &index)) {
            phonekABPhoneHomeFAXLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhoneWorkFAXLabel, &index)) {
            phonekABPhoneWorkFAXLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABPhonePagerLabel, &index)) {
            phonekABPhonePagerLabel = [multiValuePhone valueAtIndex:index];
        }

        if (FindFirstMatch(multiValuePhone, kABOtherLabel, &index)) {
            phonekABOtherLabel = [multiValuePhone valueAtIndex:index];
        }

        NSString *phones = [NSString stringWithFormat:@"Work=%@;Home=%@;Mobile=%@;Main=%@;HomeFAX=%@;WorkFAX=%@;Pager=%@;other=%@;", phoneABPhoneWorkLabel, phonekABPhoneHomeLabel, phonekABPhoneMobileLabel, phonekABPhoneMainLabel, phonekABPhoneHomeFAXLabel, phonekABPhoneWorkFAXLabel, phonekABPhonePagerLabel, phonekABOtherLabel];
        [workFaxPhone setStringValue:phones];
    }

    /*
     *   ABMutableMultiValue *multiValue;
     *   ABSearchElement    *find;
     *   NSArray            *results;
     *   ABRecord			*firstRecord;
     *   int					index = 0;
     *
     *   // Get the address book; there is only one.
     *   ABAddressBook *ab = [ABAddressBook sharedAddressBook];
     *
     *   // Create a search element
     *   find = [ABPerson searchElementForProperty: kABLastNameProperty
     *                                        label: nil
     *                                        key: nil
     *                                        value: @"Elba"
     *                                        comparison: kABEqual];
     *
     *   // Run a search
     *   results = [ab recordsMatchingSearchElement: find];
     *
     *   // How many records matched?
     *   if ([results count] > 0)
     *   {
     *    // Fill in the matching records UI
     *    [matchingRecords setIntValue:[results count]];
     *
     *    // Get the first record
     *    firstRecord = [results objectAtIndex: 0];
     *
     *    // Get the entry for the kABFirstNameProperty and fill in the first name UI
     *    [firstName setStringValue: [firstRecord valueForProperty: kABFirstNameProperty]];
     *
     *    // Create a multiValue and populate it with the items in kABAddressProperty
     *    multiValue = [firstRecord valueForProperty: kABAddressProperty];
     *
     *    // Get an index into a multiValue value for the kABAddressHomeLabel label
     *    if (FindFirstMatch(multiValue, kABAddressHomeLabel, &index))
     *    {
     *         // kABAddressHomeLabel is a NSDictionary
     *         NSMutableDictionary *dict = [[multiValue valueAtIndex: index] mutableCopy];
     *         [streetAddr setStringValue: [dict valueForKey: kABAddressStreetKey]];
     *         //[dict release];
     *    }
     *
     *    // Create a multiValue and populate it with the items in the kABPhoneProperty
     *    multiValue = [firstRecord valueForProperty: kABPhoneProperty];
     *
     *    // Get an index into multiValue for the kABPhoneWorkFAXLabel label
     *    if (FindFirstMatch(multiValue, kABPhoneWorkFAXLabel, &index)){
     *         [workFaxPhone setStringValue: [multiValue valueAtIndex: index]];
     *    }
     *   }
     */
}

Boolean FindFirstMatch(ABMutableMultiValue *multiValue, NSString *label, int *index)
{
    unsigned long   mvCount = 0;
    int             x;

    mvCount = [multiValue count];

    if (mvCount > 0) {
        for (x = 0; x < mvCount; x++) {
            NSString            *text = [multiValue labelAtIndex:x];
            NSComparisonResult  result = [text compare:label];

            if (result == NSOrderedSame) {
                *index = x;
                return true;
            }
        }
    }

    return false;
}

NSArray *FindMatchValue(ABMutableMultiValue *multiValue, NSString *label)
{
    NSMutableArray  *results = [[NSMutableArray alloc] init];
    unsigned long   mvCount = [multiValue count];

    for (int x = 0; x < mvCount; x++) {
        NSString            *text = [multiValue labelAtIndex:x];
        NSComparisonResult  result = [text compare:label];

        if (result == NSOrderedSame) {
            [results addObject:[NSNumber numberWithInt:x]];
        }
    }

    return [NSArray arrayWithArray:results];
}

- (IBAction)updateContacts:(id)sender
{
    NSArray     *results;
    ABRecord    *person;

    // Get the address book; there is only one.
    ABAddressBook *ab = [ABAddressBook sharedAddressBook];

    // find all contacts
    results = [ab people];

    // How many records matched?
    const int kMaxTestCnt = 10000;
    Boolean needSave=false;

    for (int i = 0; i < [results count]; i++) {
        // Get the first record
      //  NSLog(@"person-%d;", i);

        if (i > kMaxTestCnt) {
            break;
        }

        person = [results objectAtIndex:i];
        NSLog(@"person :%@", person);
       // needSave =  updatePhone(person) || needSave  ;
       // needSave = updateEmail(person) || needSave  ;
        needSave = updateNotes(person) || needSave  ;
        
    }

    if (needSave) [ab save];
}

Boolean addPhone(ABMutableMultiValue * destPhone,NSString * destPhoneLabel, ABMutableMultiValue    * srcPhone,NSString * srcPhoneLabel){
    
    NSArray      *phoneIndexs= FindMatchValue(srcPhone, srcPhoneLabel);
    
    long countPhone = [phoneIndexs count];
    
    if (countPhone > 0) {
        for (int i = 0; i < countPhone; i++) {
            NSString * phoneValue = [srcPhone valueAtIndex:[[phoneIndexs objectAtIndex:i] intValue]];
            NSLog(@"Phone%d:%@", i,  phoneValue);
            // set work phone;
            [destPhone addValue: phoneValue withLabel:destPhoneLabel];
        }
        
        return true;
    }

    return false;
}

Boolean updatePhone(ABRecord *person)
{
    /*
     *   目标是为所有的联系人仅保留work、home两个标签的电话及邮箱，先处理电话，再处理邮箱,各属性处理逻辑如下
     *   1、若仅有一个信息，则保留work标签
     *   2、若有两个信息，则保留work、home标签
     *   3、若有多余两个信息，则忽略；
     */
    // Get kABPhoneProperty
    Boolean isAddWork = false;
    Boolean isAddHome = false;

    ABMutableMultiValue *destPhone = [[ABMutableMultiValue alloc] init];

    /*
     *   [multiValue addValue: @"408-974-1111" withLabel: kABPhoneHomeLabel];
     *   [multiValue addValue: @"408-974-2222" withLabel: kABPhoneMobileLabel];
     *   [multiValue addValue: @"408-974-3333" withLabel: kABPhoneMainLabel];
     *   [multiValue addValue: @"408-974-4444" withLabel: kABPhoneHomeFAXLabel];
     *   [multiValue addValue: @"408-974-5555" withLabel: kABPhoneWorkFAXLabel];
     *   [multiValue addValue: @"408-974-6666" withLabel: kABPhonePagerLabel];
     *   [multiValue addValue: @"408-974-7777" withLabel: kABOtherLabel];
     */
    ABMutableMultiValue *srcPhone = [person valueForProperty:kABPhoneProperty];
    
    //check kABPhoneWorkLabel
    isAddWork = addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneWorkLabel);
    
    // check kABPhoneHomeLabel
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneHomeLabel);
    }else {
        isAddHome = addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhoneHomeLabel);
        
    }
    // check kABPhoneMobileLabel
  
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneMobileLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhoneMobileLabel);
        }
        
    }
   
    // check kABPhoneMainLabel
    
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneMainLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhoneMainLabel);
        }
        
    }
    // check kABPhoneHomeFAXLabel
    
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneHomeFAXLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhoneHomeFAXLabel);
        }
        
    }
    // check kABPhoneWorkFAXLabel
    
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhoneWorkFAXLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhoneWorkFAXLabel);
        }
        
    }
    // check kABPhonePagerLabel
    
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABPhonePagerLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABPhonePagerLabel);
        }
        
    }
    // check kABOtherLabel
    
    if(!isAddWork){
        addPhone(destPhone,kABPhoneWorkLabel,srcPhone,kABOtherLabel);
    }else {
        if(!isAddHome){
            addPhone(destPhone,kABPhoneHomeLabel,srcPhone,kABOtherLabel);
        }
        
    }
    
  // NSLog(@"new phone Value =%@;",destPhone);

    // Set value in record for kABPhoneProperty.
    return [person setValue: destPhone forProperty: kABPhoneProperty];
 }

Boolean addEmail(ABMutableMultiValue * destEmail,NSString * destEmailLabel, ABMutableMultiValue    * srcPerson,NSString * srcEmailLabel){
    
    NSArray      *emailIndexs= FindMatchValue(srcPerson, srcEmailLabel);
    
    long countPhone = [emailIndexs count];
    
    if (countPhone > 0) {
        for (int i = 0; i < countPhone; i++) {
            NSString * emailValue = [srcPerson valueAtIndex:[[emailIndexs objectAtIndex:i] intValue]];
           // NSLog(@"Email%d:%@", i,  emailValue);
            // set Email;
            [destEmail addValue: emailValue withLabel:destEmailLabel];
        }
        
        return true;
    }
    
    return false;
}
Boolean updateEmail(ABRecord *person)
{
    /*
     *   目标是为所有的联系人仅保留work、home两个标签的电话及邮箱，先处理电话，再处理邮箱,各属性处理逻辑如下
     *   1、若仅有一个信息，则保留work标签
     *   2、若有两个信息，则保留work、home标签
     *   3、若有多余两个信息，则忽略；
     */
    // get kABEmailProperty kABEmailWorkLabel, kABEmailHomeLabel,kABOtherLabel;
    Boolean isAddWork = false;
    Boolean isAddHome = false;
    
    ABMutableMultiValue *destEmail = [[ABMutableMultiValue alloc] init];
       ABMutableMultiValue *srcEmail = [person valueForProperty:kABEmailProperty];
    
    //check kABEmailWorkLabel
    isAddWork = addEmail(destEmail,kABEmailWorkLabel,srcEmail,kABEmailWorkLabel);
    
    // check kABEmailHomeLabel
    if(!isAddWork){
        addEmail(destEmail,kABEmailWorkLabel,srcEmail,kABEmailHomeLabel);
    }else {
        isAddHome = addEmail(destEmail,kABEmailHomeLabel,srcEmail,kABEmailHomeLabel);
        
    }
    // check kABOtherLabel
    
    if(!isAddWork){
        addEmail(destEmail,kABEmailWorkLabel,srcEmail,kABOtherLabel);
    }else {
        if(!isAddHome){
            addEmail(destEmail,kABEmailHomeLabel,srcEmail,kABOtherLabel);
        }
        
    }
    NSLog(@"new Email Value =%@;",destEmail);

    // Set value in record for kABEmailProperty.
   return [person setValue: destEmail forProperty: kABEmailProperty];
    
      
 
}

Boolean isExistsPhoneAndEmailNotes( NSString *  notes){
    /*
     * 目标是为所有的联系人在现有Notes上增加：Phone&Email：13922790527&liudongbao@139.com；
     增加前需要先检查当前Notes中是否已经添加了相应信息： 判断是否包含“Phone&Email”。
     [notes rangeOfString(@"Phone&Email")]
     */
    if(notes==nil){
        return false;
    }
    NSRange  range = [notes rangeOfString:@"Phone&Email"];
    Boolean isExists = ( range.location != NSNotFound);
    
    NSLog(@"notes=%@,range = %lu,NSNotFound =%lu,hasExists=%d,notes=%d ",notes,range.location,NSNotFound ,(int)isExists,(int)(notes==nil));

    return isExists ;
}

NSString *  getWorkPhones(ABRecord *person)
{
    ABMutableMultiValue *srcPhone = [person valueForProperty:kABPhoneProperty];
    NSArray      *phoneIndexs= FindMatchValue(srcPhone, kABPhoneWorkLabel);
    
    long countPhone = [phoneIndexs count];
    NSMutableString * phones = [[NSMutableString alloc] init];
    if (countPhone > 0) {
        for (int i = 0; i < countPhone; i++) {
               [phones appendFormat:@"[%@]",
            [srcPhone valueAtIndex:[[phoneIndexs objectAtIndex:i] intValue]]];
          }
        return phones;
     }

    return @"";
}
NSString *  getWorkEmails(ABRecord *person)
{
    ABMutableMultiValue *srcEmail = [person valueForProperty:kABEmailProperty];
    NSArray      *emailIndexs= FindMatchValue(srcEmail, kABEmailWorkLabel);
    
    long countEmails = [emailIndexs count];
    NSMutableString * emails = [[NSMutableString alloc] init];
    if (countEmails > 0) {
        for (int i = 0; i < countEmails; i++) {
            [emails appendFormat:@"[%@]",
             [srcEmail valueAtIndex:[[emailIndexs objectAtIndex:i] intValue]]];
        }
        return emails;
    }
    
    return @"";
}
Boolean updateNotes(ABRecord *person){
    /*
     * 目标是为所有的联系人在现有Notes上增加：Phone&Email：13922790527&liudongbao@139.com；
       增加前需要先检查当前Notes中是否已经添加了相应信息： 判断是否包含“Phone&Email”。
       [notes rangeOfString(@"Phone&Email")]
       并且若没有电话号码，则不添加相应信息；
     */
    // get  kABNoteProperty and set kABNoteProperty;
    NSString * notes = [person valueForProperty:kABNoteProperty];
      //nil;
    //@"目标是为所有的联系人在现有Notes上增加：";
    //@"目标是为所有的联系人在现有Notes上增加：Phone&Email：13922790527&liudongbao@139.com";
   // @"Phone&Email：13922790527&liudongbao@139.com";
    if (isExistsPhoneAndEmailNotes(notes)) return false;
    NSString * workPhones = getWorkPhones(person);
    if([workPhones caseInsensitiveCompare:@"" ]== NSOrderedSame) return false;
    NSString * workEmails = getWorkEmails(person);
    NSString * newNotes = nil;
     if(notes!=nil)
      newNotes = [NSString stringWithFormat:@"%@:Phone&Email：%@&%@",notes,workPhones,workEmails];
    else
      newNotes = [NSString stringWithFormat:@"Phone&Email：%@&%@",workPhones,workEmails];     
    NSLog(@"newNotes=%@",newNotes);
    return  [person setValue:newNotes forProperty:kABNoteProperty];
  
}
@end