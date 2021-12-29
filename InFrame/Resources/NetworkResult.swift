//
//  NetworkResult.swift
//  InFrame
//
//  Created by 김유진 on 2021/12/29.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    case tokenErr
    case authorityErr
}
