import SwiftUI

struct SceneView: View {
    
    @Binding var isPresented : Int
    
    
    let texts = [
                 "Hi, it's me!\nThe little adorable kid in the middle.\nToday I would like to tell you my story.",
                 
                 "When I was younger, I think time passed really quickly. And it was so long ago that my memory is fuzzy. At least, I vaguely remember happy memories of playing music in the car with my family every weekend and hanging out here and there.",
                 
                 "I first met her when I was in the band and it was love at first sight. I really liked her guitar playing. Even decades later, when she hears the songs she often played, the feelings and scenes she felt at that time come to mind clearly.",
                 
                 "The following year, we finally got married. I really want to cherish the trembling and excitement of a proposal for the rest of my life.",
                 
                 "For a long time after that, we cared for each other, loved each other, and spent every moment together. It was a great fortune for me to have a loving companion by my side who is growing old together.",
                 
                 "As if heaven needed a good person, my angelic love passed away first. Still, whenever I miss her, I think of her, listening to the song we sang together.",
                 
                 "But... at some point... my memory is getting blurry. I can't remember what I ate yesterday or what happened this morning. It feels like the inside of my head is white and empty. I don't even remember her guitar playing. I'm afraid I'll forget her too.\n\nHow am I supposed to live now?"
                                                                    ]
    
    let images = ["Pic2", "Pic3", "Pic4", "Pic5", "Pic6", "Pic7", "Pic8"]
    @State private var currentIndex = 0
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                Color(red: 0x8E/255, green: 0xCA/255, blue: 0xE6/255).ignoresSafeArea()
                
                VStack {
                    Image(images[currentIndex])
                        .resizable()
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.6)
                        .padding()
                        .transition(.scale) // scale effect
                    
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.4)
                            .foregroundColor(Color(red: 0x8b/255, green: 0x8c/255, blue: 0x89/255))
                            .ignoresSafeArea()
                        
                        VStack {
                            Text(texts[currentIndex])
                                .font(.system(size: 18, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                                .lineSpacing(3)
                            
                            Spacer()
                            
                            HStack {
                                if currentIndex != 0 {
                                    Button("← Prev") {
                                        withAnimation {
                                            currentIndex = max(currentIndex - 1, 0)
                                        }
                                    }
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(.white)
                                } else {
                                    ZStack {
                                        Button("← Prev") {
                                            withAnimation {
                                                currentIndex = max(currentIndex - 1, 0)
                                            }
                                        }
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundColor(.white)
                                    }
                                    .hidden()
                                }
                                    
                                
                                Spacer()
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.03)
                                
                                Button("Next →") {
                                    if (currentIndex == 6)
                                    {
                                        isPresented = 2
                                    } else {
                                        withAnimation {
                                            currentIndex = min(currentIndex + 1, texts.count - 1)
                                        }
                                    }
                                }
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(.white)
                            }
                            Spacer()
                                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.05)
                        }
                    }
                }
            }
        }
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView(isPresented: .constant(1))
    }
}
