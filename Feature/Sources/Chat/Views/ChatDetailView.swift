import SwiftUI

struct ChatDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var messageText: String = ""
    @State private var chatRoom: ChatRoom
    
    init(chatRoom: ChatRoom) {
        _chatRoom = State(initialValue: chatRoom)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // 헤더
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primary)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Text(chatRoom.partnerName)
                            .font(.custom("GmarketSansBold", size: 17))
                            .foregroundColor(Color.primary)
                        Text(chatRoom.productTitle)
                            .font(.custom("GmarketSansLight", size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        // 프로필 보기 기능
                    } label: {
                        Image(chatRoom.partnerImage)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 5)
                
                Divider()
                    .padding(.bottom, 5)
                
                // 채팅 메시지 목록
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(chatRoom.messages) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    .onChange(of: chatRoom.messages.count) { _ in
                        withAnimation {
                            proxy.scrollTo(chatRoom.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            // 메시지 입력 영역
            VStack(spacing: 5) {
                Divider()
                HStack(spacing: 12) {
                    TextField("메시지를 입력하세요", text: $messageText)
                        .font(.custom("GmarketSansLight", size: 15))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Button {
                        sendMessage()
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(messageText.isEmpty ? .gray : Color("suwonBlue"))
                    }
                    .disabled(messageText.isEmpty)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.white)
                .keyboardAdaptive()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let newMessage = Message(
            content: messageText,
            isFromMe: true,
            timestamp: Date()
        )
        
        chatRoom.messages.append(newMessage)
        chatRoom.lastMessage = messageText
        chatRoom.lastMessageTime = Date()
        
        messageText = ""
    }
}

// 메세지 버블
struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromMe {
                Spacer()
            }
            
            Text(message.content)
                .font(.custom("GmarketSansLight", size: 15))
                .foregroundColor(message.isFromMe ? .white : .black)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(message.isFromMe ? Color("suwonBlue") : Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            if !message.isFromMe {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatDetailView(chatRoom: ChatRoom.sampleChatRooms[0])
} 
