//
//  LaunchView.swift
//  MacDonald's
//
//  Created by David Jang on 4/3/24.
//

import SwiftUI
import UIKit

struct LaunchView: View {
    
    @State private var pattyColor: Color = .pink.opacity(0.5)
    @State private var topBreadRotation: Double = -30
    @State private var topBreadScale: CGFloat = 1.0
    
    // 패티 색상 변경과 동시에 맨 위 빵의 애니메이션을 시작하기 위한 트리거
    @State private var triggerTopBreadAnimation: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.3).edgesIgnoringSafeArea(.all)
            VStack {
                TopBreadView(topBreadRotation: $topBreadRotation, topBreadScale: $topBreadScale)
                
                LettuceView()
                
                PattyView(pattyColor: $pattyColor)
                
                BottomBreadView()
            }
            .shadow(color: Color.black.opacity(0.5), radius: 16, x: 16, y: 16) // 그림자
            .onChange(of: pattyColor) { _ in
                triggerTopBreadAnimation = true
            }
            .onChange(of: triggerTopBreadAnimation) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.bouncy(duration: 0.2)) {
                        topBreadRotation = 8
                        topBreadScale = 1.0
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    // "advanceToNextScreen" 알림 전송
                    NotificationCenter.default.post(name: NSNotification.Name("AdvanceToNextScreen"), object: nil)
                }
        }
    }
}

struct TopBreadView: View {
    
    @Binding var topBreadRotation: Double
    @Binding var topBreadScale: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .stroke(Color.yellow, lineWidth: 4)
            .frame(width: 80, height: 15)
            .rotationEffect(.degrees(topBreadRotation), anchor: .leading)
            .scaleEffect(topBreadScale)
    }
}

struct BottomBreadView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .stroke(Color.yellow, lineWidth: 4)
            .frame(width: 80, height: 15)
    }
}

struct LettuceView: View {
    
    var body: some View {
        
        // 물결 패턴
        Path { path in
            path.move(to: CGPoint(x: 0, y: 10))
            path.addCurve(to: CGPoint(x: 20, y: 10), control1: CGPoint(x: 5, y: 0), control2: CGPoint(x: 15, y: 20))
            path.addCurve(to: CGPoint(x: 40, y: 10), control1: CGPoint(x: 25, y: 0), control2: CGPoint(x: 35, y: 20))
            path.addCurve(to: CGPoint(x: 60, y: 10), control1: CGPoint(x: 45, y: 0), control2: CGPoint(x: 55, y: 20))
            path.addCurve(to: CGPoint(x: 80, y: 10), control1: CGPoint(x: 65, y: 0), control2: CGPoint(x: 75, y: 20))
        }
        .stroke(Color.green, lineWidth: 4)
        .frame(width: 80, height: 15)
    }
}

struct PattyView: View {
    @Binding var pattyColor: Color
    @State private var vibrationOffset: CGFloat = 0.0
    @State private var isVibrating: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .frame(width: 88, height: 15)
            .foregroundColor(pattyColor)
            .offset(x: vibrationOffset)
            .onAppear {
                withAnimation(.linear(duration: 3)) {
                    pattyColor = .brown
                }
                // 진동 시작
                isVibrating = true
                startVibrating()
            }
    }
    
    func startVibrating() {
        
        // 진동 효과 시작
        let duration: TimeInterval = 0.1
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { timer in
            if isVibrating {
                withAnimation(.easeInOut(duration: duration)) {
                    vibrationOffset = (vibrationOffset == 0 ? -8 : 0)
                }
            } else {
                // 진동 멈춤
                vibrationOffset = 0
                timer.invalidate()
            }
        }
        
        // 3초 후에 진동 멈춤
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isVibrating = false
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
