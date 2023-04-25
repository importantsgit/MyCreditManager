//
//  cal.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

open class CreditManager {
    static var shared = CreditManager()
    private var studentsManager = StudentsManager()
    
    private init() {}
    
    open func activeMenu() {
        while true {
            print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
            if let input = readLine() {
                switch input {
                case "1":
                    addStudent()
                case "2":
                    removeStudent()
                case "3":
                    addCredit()
                case "4":
                    removeCredit()
                case "5":
                    viewRatings()
                case "X":
                    print("프로그램을 종료합니다...")
                    return
                default:
                    print("뭔가 입력이 잘못되었습니다,. 1~5 사이의 숫자, 혹은 X를 입력해주세요.")
                }
            } else {
                print("뭔가 입력이 잘못되었습니다,. 1~5 사이의 숫자, 혹은 X를 입력해주세요.")
            }
        }
    }
    
    
    // 학생 추가하는 함수
    private func addStudent(){
        print("추가할 학생의 이름을 입력해주세요")
        if let name = readLine() {
            switch studentsManager.addStudent(name: name) {
            case .success:
                print("\(name) 학생을 추가했습니다.")
            case .duplication:
                print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            default:
                print("Error")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }

    }
    
    // 학생 제거하는 함수
    private func removeStudent(){
        print("삭제할 학생의 이름을 입력해주세요")
        if let name = readLine() {
            switch studentsManager.removeStudent(name: name) {
            case .success:
                print("\(name) 학생을 삭제하였습니다.")
            case .notExist:
                print("\(name) 학생을 찾지 못했습니다.")
            default:
                print("Error")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    
    // 성적 추가하는 함수
    private func addCredit(){
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력 예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        if let list = readLine()?.split(separator: " ").map({String($0)}),
           list.count == 3,
           checkCredit(credit: list[2]){
            let name = list[0], subject = list[1], credit = list[2]
            switch studentsManager.addSubject(name: name, subject: subject, rating: credit) {
            case .success:
                print("\(name) 학생의 \(subject) 과목이 \(credit)로 추가(변경)되었습니다.")
            case .notExist:
                //MARK: 실패 부분의 언급이 없음
                print("\(name) 학생을 찾지 못했습니다.")
            default:
                print("Error")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    
    // 성적 제거하는 함수
    private func removeCredit(){
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력 예) Mickey Swift")
        if let list = readLine()?.split(separator: " ").map({String($0)}),
           list.count == 2{
            let name = list[0], subject = list[1]
            switch studentsManager.removeSubject(name: name, subject: subject) {
            case .success:
                print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
            case .notExist:
                print("\(name) 학생을 찾지 못했습니다.")
            default:
                print("Error")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    
    private func viewRatings(){
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        if let name = readLine() {
            if studentsManager.viewRatings(name: name) == .notExist {
                print("\(name) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    
    private func checkCredit(credit: String)->Bool{
        return studentsManager.credit.contains(where: {$0.key == credit})
    }
}
