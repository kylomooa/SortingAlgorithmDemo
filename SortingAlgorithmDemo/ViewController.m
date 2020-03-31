//
//  ViewController.m
//  SortingAlgorithmDemo
//
//  Created by maoqiang on 2020/3/31.
//  Copyright © 2020 maoqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bubbleSort];
    [self selectionSort];
    [self insertionSort];
}

/**
1.冒泡排序(稳定排序，时间复杂度为0(n2))
内循环两两比较互换位置，将极值放入数组的前部
 */
-(void)bubbleSort{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataArray];
    
    //外循环为排序趟数，6个数需进行5趟排序
    for (int i=0; i<array.count-1; i++) {
        
        //两两比较
        for (int j=0; j<array.count-1-i; j++) {
            
            //多次交换位置
            if ([array[j] integerValue] > [array[j+1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"冒泡排序结果%@",array);
}


/**
 2.选择排序(不稳定排序，时间复杂度为0(n2))
 内循环两两比较后找出一个极值放入数组的前部
 */
-(void)selectionSort{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataArray];
    
    //外循环为排序趟数，6个数需进行5趟排序
    for (int i=0; i<array.count-1; i++) {
        
        int min=i;
        //找出最小下标
        for (int j=i+1; j<array.count; j++) {
            if ([array[j] integerValue] < [array[min] integerValue]) {
                min = j;
            }
        }
        
        //将极值放入数组前部
        if (min != i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
    NSLog(@"选择排序结果%@",array);
}

/**
 3.插入排序(稳定排序，时间复杂度为0(n2))
 */

-(void)insertionSort{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.dataArray];
    
    //外循环为排序趟数，6个数需进行5趟排序
    for (int i=1; i<array.count; i++) {
        
        //取下标为i的数进行遍历比较（和冒泡排序的区别在此）
        NSNumber *v=array[i];
        
        for (int j = i-1; j>=0; j--) {
            if ([array[j] integerValue] > [v integerValue]) {
                //多次交换位置
                [array exchangeObjectAtIndex:j withObjectAtIndex:i];
            }
        }
    }
    NSLog(@"插入排序结果%@",array);
}


-(NSArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = @[@(6),@(3),@(45),@(9),@(10),@(20)];
    }
    return _dataArray;;
}
@end
