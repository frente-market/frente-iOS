import Foundation

struct ChatRoom: Identifiable {
    let id = UUID()
    let productTitle: String
    let productImage: String
    let partnerName: String
    let partnerImage: String
    var lastMessage: String
    var lastMessageTime: Date
    var messages: [Message]
}

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isFromMe: Bool
    let timestamp: Date
}

// 샘플 데이터
extension ChatRoom {
    static let sampleChatRooms = [
        ChatRoom(
            productTitle: "수원삼성 짭트로 L",
            productImage: "sample-product",
            partnerName: "교동블루윙즈",
            partnerImage: "sample-profile",
            lastMessage: "네, 광교역에서 만나볼 수 있을까요?",
            lastMessageTime: Date(),
            messages: [
                Message(content: "안녕하세요, 유니폼 구매하고 싶습니다.", isFromMe: true, timestamp: Date().addingTimeInterval(-3600)),
                Message(content: "네, 안녕하세요!", isFromMe: false, timestamp: Date().addingTimeInterval(-3500)),
                Message(content: "가격은 7만원이 맞나요?", isFromMe: true, timestamp: Date().addingTimeInterval(-3400)),
                Message(content: "네, 맞습니다.", isFromMe: false, timestamp: Date().addingTimeInterval(-3300)),
                Message(content: "네, 광교역에서 만나볼 수 있을까요?", isFromMe: true, timestamp: Date().addingTimeInterval(-3200))
            ]
        ),
        ChatRoom(
            productTitle: "수원 삼성 응원봉",
            productImage: "sample-product",
            partnerName: "수원팬",
            partnerImage: "sample-profile",
            lastMessage: "네, 직거래 가능합니다.",
            lastMessageTime: Date().addingTimeInterval(-86400),
            messages: [
                Message(content: "응원봉 구매하고 싶습니다.", isFromMe: true, timestamp: Date().addingTimeInterval(-86400)),
                Message(content: "네, 직거래 가능합니다.", isFromMe: false, timestamp: Date().addingTimeInterval(-86300))
            ]
        )
    ]
} 