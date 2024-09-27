//
//  UeberUnsView.swift
//  BSG KALI WERRA TIEFENORT
//
//  Created by Jan Morgenweck on 31.07.24.
//

import SwiftUI
import AVKit

struct UeberUnsView: View {
    
    @State private var selectedImageUrl: ImageItem? = nil
    @State private var player = AVPlayer(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/Hymne%2FKali%20Werra%20Hymne%20ohne%20zweite%20Stimme.mp3?alt=media&token=144ff020-d69b-464f-a024-41d02786ecbb")!)
    @State private var isPlaying: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("Logo-BSG-Kali-Werra")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .opacity(0.05)
                
                    ScrollView {
                        VStack {
                            Text(LocalizedStringKey("unsereSportstätte"))
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            
                            Text(LocalizedStringKey("dieGeschichte"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.vertical)
                            
                            
                            HStack {
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FBild15-Kopie.jpg?alt=media&token=f810e9a0-5ba0-40cf-8788-f284a7785db0")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/Bild15-Kopie.jpeg")
                                    }
                                Spacer()
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FBild7-Kopie.jpg?alt=media&token=a3904bae-9ef5-49ce-968e-a707f342f213")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/Bild7-Kopie.jpeg")
                                    }
                            }
                            .padding(.horizontal, 24)
                            
                            
                            Text(LocalizedStringKey("mitDerUnterstützung"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.vertical)
                            
                            
                            HStack {
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FBild13-Kopie.jpg?alt=media&token=95c5d4a8-57ef-4071-936d-2b421fd36ea3")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/Bild13-Kopie.jpeg")
                                    }
                                Spacer()
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FBild5-Kopie.jpg?alt=media&token=d8ddedb8-f401-477e-bf79-f99912d0b3c6")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/Bild5-Kopie.jpeg")
                                    }
                            }
                            .padding(.horizontal, 24)
                            
                            
                            Text(LocalizedStringKey("nachDemPolitischen"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.vertical)
                            
                            HStack {
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2F122117350_3446027548806393_7339724700147987888_n-Kopie.jpeg?alt=media&token=bb7f6401-743e-488f-9df8-4fe5bf7c7359")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/122117350_3446027548806393_7339724700147987888_n-Kopie.jpeg")
                                    }
                                Spacer()
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2F122164055_980629602420074_1064451657179761445_n-Kopie.jpeg?alt=media&token=138f6707-2f89-4580-9ec5-cb13503dd902")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/122164055_980629602420074_1064451657179761445_n-Kopie.jpeg")
                                    }
                            }
                            .padding(.horizontal, 24)
                            
                            Text(LocalizedStringKey("inDerZeit"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.vertical)
                            
                            HStack {
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FUmbau2-Kopie.jpeg?alt=media&token=cdf61203-f1cc-4b32-8b88-065f05a9d821")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url:  "https://kali-werra.de/wp-content/uploads/2022/09/Umbau2-Kopie.jpeg")
                                    }
                                Spacer()
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2FUmbau-Kaffeetaelchen-Kopie.jpeg?alt=media&token=70162138-851c-45b7-a252-def4fecc008b")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url: "https://kali-werra.de/wp-content/uploads/2022/09/Umbau-Kaffeeta%CC%88lchen-Kopie.jpeg")
                                    }
                            }
                            .padding(.horizontal, 24)
                            
                            Text(LocalizedStringKey("mitDerEingemeindung"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                                .padding(.vertical)
                            
                            HStack {
                                UeberUnsAsyncImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/kali-werra-tiefenort.appspot.com/o/bilderStadion%2Fpicture-1600.jpeg?alt=media&token=691ccd81-c086-49b2-b3a7-43fb62c1a99c")
                                    .onTapGesture {
                                        selectedImageUrl = ImageItem(url: "https://kali-werra.de/wp-content/uploads/2022/09/picture-1600.jpeg")
                                    }
                                Spacer()
                            }
                            .padding(.horizontal, 24)
                            
                            VideosView()
                                .padding()
                            
                            Button {
                                if isPlaying {
                                    isPlaying.toggle()
                                    player.pause()
                                } else {
                                    isPlaying.toggle()
                                    player.play()
                                }
                            } label: {
                                Text(isPlaying ? "Vereinshymne stoppen" : "VereinsHymne abspielen")
                            }
                            .buttonStyle()
                            .padding(.bottom, 32)
                        }
                    }
                    .scrollIndicators(.never)
                
                }
                .navigationTitle("Über Uns")
                .sheet(item: $selectedImageUrl) { item in
                    FullScreenImageView(imageUrl: item.url)
                }
                .onDisappear {
                    player.pause()
                }
            }
        }
    }

#Preview {
    UeberUnsView()
}
