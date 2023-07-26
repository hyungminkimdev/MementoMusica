import SwiftUI
import AVFoundation


struct GuitarView: View {
    
    let audioFilesC = ["C0", "C1", "C2", "C3", "C4", "C5"]
    let audioFilesFM7 = ["FM70", "FM71", "FM72", "FM73", "FM74", "FM75"]
    let audioFilesBm = ["Bm0", "Bm1", "Bm2", "Bm3", "Bm4", "Bm5"]
    let audioFilesE = ["E0", "E1", "E2", "E3", "E4", "E5"]
//    var audioPlayers = [AVAudioPlayer?](repeating: nil, count: 24)

    
    // switch view
    @Binding var isPresented : Int
    
    // Ipad View
    @State private var isIpad = (UIDevice.current.userInterfaceIdiom == .pad)
    
    // popup view
    @State var isPopupVisible = true
    @State var isStroke = false
    
    // ProgressView
    @State private var downloadAmount1 = 0.0
    @State private var downloadAmount2 = 0.0
    @State private var downloadAmount3 = 0.0
    @State private var downloadAmount4 = 0.0
    @State private var downloaded = false
    
    // Toggle
    @State private var selectedButton: Int = 0
    @State private var line: Int = 0
    
    // Guitar Line
    @State private var offsets = Array(repeating: CGFloat(0.0), count: 6)
    
    var body: some View{
       
        
        GeometryReader { geo in
            
            ZStack {
                
                Color(red: 0x8E/255, green: 0xCA/255, blue: 0xE6/255).ignoresSafeArea()
                
                VStack(spacing: 0){
                    
                    //1
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.02)
                    
                    //2
                    switch (selectedButton) {
                    case 0:
                        ProgressView(value: downloadAmount1, total: 100)
                            .accentColor(Color(.blue))
                            .scaleEffect(x: 1, y: geo.size.height * 0.012, anchor: .center)
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.05)
                    case 1:
                        ProgressView(value: downloadAmount2, total: 100)
                            .accentColor(Color(.blue))
                            .scaleEffect(x: 1, y: geo.size.height * 0.012, anchor: .center)
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.05)
                    case 2:
                        ProgressView(value: downloadAmount3, total: 100)
                            .accentColor(Color(.blue))
                            .scaleEffect(x: 1, y: geo.size.height * 0.012, anchor: .center)
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.05)
                    case 3:
                        ProgressView(value: downloadAmount4, total: 100)
                            .accentColor(Color(.blue))
                            .scaleEffect(x: 1, y: geo.size.height * 0.012, anchor: .center)
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.05)
                    default :
                        ProgressView(value: downloadAmount1, total: 100)
                            .accentColor(Color(.blue))
                            .scaleEffect(x: 1, y: geo.size.height * 0.012, anchor: .center)
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.05)
                    }
                    
                    //3
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.03)
                    
                    //4
                    // 폴라로이드 사진
                    ZStack {
                        Image("polPicB")
                            .resizable()
                            .frame(width: isIpad ?
                                   geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                        switch (selectedButton) {
                        case 0:
                            Image("Pol1")
                                .resizable()
                                .frame(width: isIpad ?
                                       geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                                .opacity(downloadAmount1/100)
                        case 1:
                            Image("Pol2")
                                .resizable()
                                .frame(width: isIpad ?
                                       geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                                .opacity(downloadAmount2/100)
                        case 2:
                            Image("Pol3")
                                .resizable()
                                .frame(width: isIpad ?
                                       geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                                .opacity(downloadAmount3/100)
                        case 3:
                            Image("Pol4")
                                .resizable()
                                .frame(width: isIpad ?
                                       geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                                .opacity(downloadAmount4/100)
                        default:
                            Image("Pol1")
                                .resizable()
                                .frame(width: isIpad ?
                                       geo.size.width * 0.5 : geo.size.width * 0.7, height: geo.size.height * 0.41)
                                .opacity(downloadAmount1/100)
                        }
                    }
                    
                    //5
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.04)
                    
                    //6
                    ZStack {
                        // 회색배경
                        Rectangle()
                            .fill(Color(red: 0x8b/255, green: 0x8c/255, blue: 0x89/255))
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.5)
                        
                        VStack(spacing: 30) {
                            // 코드 선택 캡슐
                            HStack(spacing:  isIpad ? 40 : 15) {
                                Button(action: { selectedButton = 0 }) {
                                    Capsule()
                                        .foregroundColor(selectedButton == 0 ? .blue : Color(red: 0xC6/255, green: 0xC7/255, blue: 0xc4/255))
                                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.065)
                                        .overlay(Text("C").foregroundColor(.black)
                                            .font(.system(size: geo.size.height * 0.03, weight: .regular)))
                                }
                                Button(action: { selectedButton = 1 }) {
                                    Capsule()
                                        .foregroundColor(selectedButton == 1 ? .blue : Color(red: 0xC6/255, green: 0xC7/255, blue: 0xc4/255))
                                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.065)
                                        .overlay(Text("FM7").foregroundColor(.black)
                                            .font(.system(size: geo.size.height * 0.03, weight: .regular)))
                                }
                                Button(action: { selectedButton = 2 }) {
                                    Capsule()
                                        .foregroundColor(selectedButton == 2 ? .blue : Color(red: 0xC6/255, green: 0xC7/255, blue: 0xc4/255))
                                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.065)
                                        .overlay(Text("Bm").foregroundColor(.black)
                                            .font(.system(size: geo.size.height * 0.03, weight: .regular)))
                                }
                                Button(action: { selectedButton = 3 }) {
                                    Capsule()
                                        .foregroundColor(selectedButton == 3 ? .blue : Color(red: 0xC6/255, green: 0xC7/255, blue: 0xc4/255))
                                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.065)
                                        .overlay(Text("E").foregroundColor(.black)
                                            .font(.system(size: geo.size.height * 0.03, weight: .regular)))
                                }
                            } // HStack
                            
                            ZStack {
                                // 통기타 본체
                                Rectangle()
                                    .fill(Color(hue: 0.081, saturation: 0.764, brightness: 0.841))
                                    .frame(width: geo.size.width * 1, height: isIpad ? geo.size.height * 0.35 : geo.size.height * 0.4)
                                    .cornerRadius(30)
                                
                                // 통기타 문양
                                Circle()
                                    .fill(Color(hue: 0.067, saturation: 0.3, brightness: 0.888))
                                    .frame(width: geo.size.width * 0.7, height: isIpad ? geo.size.height * 0.32 : geo.size.height * 0.7)
                                
                                // 통기타 구멍
                                Circle()
                                    .fill(Color(hue: 0.067, saturation: 0.725, brightness: 0.29))
                                    .frame(width: geo.size.width * 0.6, height: isIpad ? geo.size.height * 0.28 :geo.size.height * 0.6)
                                
                                VStack (spacing: isIpad ? 40 : 20) {
                                    ForEach(offsets.indices, id: \.self) { index in
                                        Line()
                                            .stroke(style: StrokeStyle(lineWidth: isIpad ? 16 : 10, dash: [0.8]))
                                            .frame(height: isIpad ? 20 : 15)
                                            .foregroundColor(Color(hue: 0.114, saturation: 0.133, brightness: 0.845))
                                            .offset(y: offsets[index])
                                            .onTapGesture{
                                                
                                                switch (selectedButton) {
                                                case 0:
                                                    if downloadAmount1 < 100 {
                                                        downloadAmount1 += 5
                                                    }
                                                case 1:
                                                    if downloadAmount2 < 100 {
                                                        downloadAmount2 += 5
                                                    }
                                                case 2:
                                                    if downloadAmount3 < 100 {
                                                        downloadAmount3 += 5
                                                    }
                                                case 3:
                                                    if downloadAmount4 < 100 {
                                                        downloadAmount4 += 5
                                                    }
                                                default:
                                                    if downloadAmount1 < 100 {
                                                        downloadAmount1 += 5
                                                    }
                                                }
                                                
                                                if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                    downloadAmount4 >= 100){
                                                        downloaded = true
                                                }
                                                
                                                withAnimation(.default) {
                                                    self.offsets[index] = 1
                                                }
                                                
                                                
                                                withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                    self.offsets[index] = -1
                                                }
                                            }
                                    }
                                } // Line VStack : 기타줄
                                
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: geo.size.width * 1, height: isIpad ? geo.size.height * 0.35 : geo.size.height * 0.4)
                                    .cornerRadius(30)
                                    .opacity(0.001)
                                    .ignoresSafeArea()
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onChanged { value in
                                                switch (value.location.y) {
                                                case let x where x >= geo.size.height * 0.175 - 100 && x < geo.size.height * 0.175 - 75:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        
                                                        if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                            downloadAmount4 >= 100){
                                                                downloaded = true
                                                        }
                                                        
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[0] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[0] = -1
                                                    }
                                                    line = 0
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                case let x where x >= geo.size.height * 0.175 - 55 && x < geo.size.height * 0.175 - 35:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[1] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[1] = -1
                                                    }
                                                    
                                                    line = 1
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                case let x where x >= geo.size.height * 0.175 - 15 && x < geo.size.height * 0.175:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[2] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[2] = -1
                                                    }
                                                    line = 2
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                case let x where x >= geo.size.height * 0.175 + 20 && x < geo.size.height * 0.175 + 35:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[3] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[3] = -1
                                                    }
                                                    
                                                    line = 3
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                case let x where x >= geo.size.height * 0.175 + 55 && x < geo.size.height * 0.175 + 70:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[4] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[4] = -1
                                                    }
                                                    
                                                    line = 4
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                case let x where x >= geo.size.height * 0.175 + 95 && x < geo.size.height * 0.175 + 110:
                                                    if !isStroke {
                                                        isStroke = true
                                                        switch (selectedButton) {
                                                        case 0:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        case 1:
                                                            if downloadAmount2 < 100 {
                                                                downloadAmount2 += 5
                                                            }
                                                        case 2:
                                                            if downloadAmount3 < 100 {
                                                                downloadAmount3 += 5
                                                            }
                                                        case 3:
                                                            if downloadAmount4 < 100 {
                                                                downloadAmount4 += 5
                                                            }
                                                        default:
                                                            if downloadAmount1 < 100 {
                                                                downloadAmount1 += 5
                                                            }
                                                        }
                                                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                                            isStroke = false
                                                        }
                                                    }
                                                    withAnimation(.default) {
                                                        self.offsets[5] = 1
                                                    }
                                                    withAnimation(Animation.easeInOut(duration: 0.05).repeatCount(40)) {
                                                        self.offsets[5] = -1
                                                    }
                                                    line = 5
                                                    playSound(code: selectedButton, line: line)
                                                    
                                                    if (downloadAmount1 >= 100 && downloadAmount2 >= 100 && downloadAmount3 >= 100 &&
                                                        downloadAmount4 >= 100){
                                                            downloaded = true
                                                    }
                                                    
                                                default:
                                                    break
                                                }
                                            }
                                    )
                            } // ZStack : 기타 + 기타줄
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.35)
                        } // VStack : 캡슐 + 기타
                    } // ZStack : 회색배경 + VStack
                }
            
                // PopupGuitarStart
                if isPopupVisible {
                    PopupView(isPopupVisible: $isPopupVisible)
                    }
            } // ZStack
        }
    }
    
}


var audioPlayers = [AVAudioPlayer?](repeating: nil, count: 24)

func playSound(code: Int, line: Int){
    
    let audioFilesC = ["C0", "C1", "C2", "C3", "C4", "C5"]
    let audioFilesFM7 = ["FM70", "FM71", "FM72", "FM73", "FM74", "FM75"]
    let audioFilesBm = ["Bm0", "Bm1", "Bm2", "Bm3", "Bm4", "Bm5"]
    let audioFilesE = ["E0", "E1", "E2", "E3", "E4", "E5"]
    
    var codeRefer: [String] = []
    
    switch (code){
    case 0:
        codeRefer = audioFilesC
    case 1:
        codeRefer = audioFilesFM7
    case 2:
        codeRefer = audioFilesBm
    case 3:
        codeRefer = audioFilesE
    default:
        codeRefer = audioFilesC
    }
    
    let url = Bundle.main.url(forResource: codeRefer[line], withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        audioPlayers[code * 6 + line] = try AVAudioPlayer(contentsOf: url!)
        audioPlayers[code * 6 + line]?.setVolume(1, fadeDuration: 0.1)
        audioPlayers[code * 6 + line]?.play()
    } catch {
        print("Error in playingSound")
    }
}
    
struct PopupView: View {
    @Binding var isPopupVisible: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Please, play the guitar for him, who is gradually losing his memory!\n\nSelect a guitar chord that contains his beautiful memories and emotions, and touch or drag the guitar string to play.\n\nHelp him relive the memories he cherished.")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .regular))
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button("Continue ➤") {
                            isPopupVisible = false
                        }
                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.1)
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    }
                }
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.85)
                .background(Color(hue: 0.081, saturation: 0.764, brightness: 0.841))
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}
    
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
    
// Preview
struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(isPresented: .constant(1))
    }
}
