//
//  ViewController.m
//  FMDBTestPrimary
//
//  Created by dqw on 16/1/10.
//  Copyright © 2016年 dqw. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface ViewController ()
{
    
}
@property (nonatomic, copy) NSString *dbpath;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    self.dbpath = [docPath stringByAppendingPathComponent:@"dqw22.sqlite"];
}
- (IBAction)createTable:(id)sender {
//    NSFileManager *flieManager = [NSFileManager defaultManager];
//    if ([flieManager fileExistsAtPath:self.dbpath] == NO) {
//        FMDatabase *db = [FMDatabase databaseWithPath:self.dbpath];
//        if ([db open]) {
////            NSString *sql = @"create table if not exists 'User'(\
////            'id'    integer ,\
////            'name'  varchar(30) ,\
////            );";
////            NSString *sql = @"CREATE TABLE IF NOT EXISTS 'User'(\
////            id      INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL  ,\
////            name VARCHAR(30) ,\
////            );";
////             NSString * sql = @"CREATE TABLE 'User' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'password' VARCHAR(30))";
//            
//            
////          NSString *sql =  @"CREATE TABLE IF NOT EXISTS tb_user_profile(\
////            uid             NVARCHAR(50)        ,\
////            name         NVARCHAR(50) 		,\
////            CONSTRAINT pk_contact_friend PRIMARY KEY (uid)\
////            );";
////            NSString *sql = @"CREATE TABLE IF NOT EXISTS User (\
////            id      INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,\
////            name    VARCHAR(30) \
////            );";
////            NSString *sql = @"CREATE TABLE IF NOT EXISTS User (id  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , name    VARCHAR(30));";
//            NSString *sql = @"CREATE TABLE IF NOT EXISTS User (\
//            id      INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,\
//            name    VARCHAR(30) \
//            );";
//
//            BOOL res = [db executeQuery:sql];
//            if(!res)
//            {
//                NSLog(@"%@", @"error create table");
//            }else{
//                NSLog(@"%@", @"succ create table");
//            }
//            
//        } else
//        {
//            NSLog(@"%@", @"error open db")  ;
//        }
//    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.dbpath] == NO) {
        // create it
        FMDatabase * db = [FMDatabase databaseWithPath:self.dbpath];
        if ([db open]) {
            NSString * sql = @"CREATE TABLE 'User' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'password' VARCHAR(30), 'arr' TEXT)";
            BOOL res = [db executeUpdate:sql];
            if (!res) {
                                NSLog(@"%@", @"error create table");
            } else {
                                NSLog(@"%@", @"succ create table");
            }
            [db close];
        } else {
                        NSLog(@"%@", @"error open db")  ;
        }
    }
}

- (IBAction)insetData:(id)sender {
    
//    static int index = 1;
//    FMDatabase *db = [FMDatabase databaseWithPath:self.dbpath];
//    if (([db open])) {
//        NSString *sql = @"insert into User(name, id) values(?, ?)";
////         NSString * sql = @"insert into User (name)";
//        NSString *name = [NSString stringWithFormat:@"dqw%d", index++];
//        BOOL res = [db executeUpdate:sql,name,1];
    static int idx = 1;
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbpath];
    if ([db open]) {
        
        NSArray *arr = @[@"text1", @"text2"];
        NSData *data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
        NSString *arrStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSString * sql = @"insert into user (name, arr) values(?, ?) ";
        NSString * name = [NSString stringWithFormat:@"dqw%d", idx++];
        BOOL res = [db executeUpdate:sql, name, arrStr];
        if (!res) {
            NSLog(@"%@", @"error");
        }else{
            NSLog(@"%@", @"succ");
        }
        [db close];
        
    }
}

- (IBAction)queryData:(id)sender {
    
    FMDatabase *db = [FMDatabase databaseWithPath:self.dbpath];
    if ([db open]) {
        NSString *sql = @"select * from user";
        FMResultSet *res = [db executeQuery:sql];
        while ([res next]) {
            int id = [res intForColumn:@"id"];
            NSString *name = [res stringForColumn:@"name"];
            NSString *pass = [res stringForColumn:@"password"];
            NSString *arrStr = [res stringForColumn:@"arr"];
            NSLog(@"%d, %@, %@, %@", id , name, pass, arrStr);
            
        }
    }
}
- (IBAction)clearData:(id)sender {
    
    dispatch_queue_t queue = dispatch_queue_create("queu", NULL);
    FMDatabaseQueue *queuee = [FMDatabaseQueue databaseQueueWithPath:self.dbpath];
    
    dispatch_async(queue, ^{
        [queuee inDatabase:^(FMDatabase *db) {
            NSString *sql = @"DELETE FROM user where id > 20";
          BOOL res =  [db executeUpdate:sql];
            if (res) {
                NSLog(@"%@", @"succ");
            }
            
        }];
    });
    
}
- (IBAction)multiThread:(id)sender {
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbpath];
    dispatch_queue_t q1 = dispatch_queue_create("q1", NULL);
    dispatch_queue_t q2 = dispatch_queue_create("q2", NULL);
    dispatch_async(q1, ^{
        NSLog(@"outer1  %@", [NSThread currentThread]);

        for (int i = 0; i < 10; i++) {
            [queue inDatabase:^(FMDatabase *db) {
                NSLog(@"inner1  %@", [NSThread currentThread]);

                NSString *sql = @"insert into user (name, password) values(? , ?)";
//                NSString *name = [NSString stringWithFormat:@"queue1   %d", i];
                NSString *name  = [NSString stringWithFormat:@"queue1 %d", i];
                BOOL res = [db executeUpdate:sql, name, @"wang1"];
                if (!res) {
                    NSLog(@"%@", @"ERROR1");
                    
                }else
                {
                    NSLog(@"%@", @"succ1");
                }
            }];
        }
    });
    
    dispatch_async(q2, ^{
        NSLog(@"outer2  %@", [NSThread currentThread]);
        
        for (int i = 0; i < 10; i++) {
            [queue inDatabase:^(FMDatabase *db) {
                NSLog(@"inner2  %@", [NSThread currentThread]);
                
                NSString *sql = @"insert into user (name, password) values(? , ?)";
                //                NSString *name = [NSString stringWithFormat:@"queue1   %d", i];
                NSString *name  = [NSString stringWithFormat:@"queue2 %d", i];
                BOOL res = [db executeUpdate:sql, name, @"wang2"];
                if (!res) {
                    NSLog(@"%@", @"ERROR2");
                    
                }else
                {
                    NSLog(@"%@", @"succ2");
                }
            }];
        }
    });
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
