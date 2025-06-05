import SwiftUI

struct NoticeDetailView: View {
    @Environment(\.dismiss) var dismiss
    let notice: Notice
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // 뒤로가기 버튼
                VStack(alignment: .leading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primary)
                            .contentShape(.rect)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                }
                .padding(.leading, 13)
                .padding(.top, 16)
                
                // 본문 스크롤
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // 제목
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 8) {
                                if notice.isImportant {
                                    Text("중요")
                                        .font(.custom("GmarketSansBold", size: 12))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color("suwonBlue"))
                                        .cornerRadius(4)
                                }
                                Text(notice.title)
                                    .font(.custom("GmarketSansBold", size: 20))
                                    .foregroundColor(Color.primary)
                            }
                            Text(notice.date)
                                .font(.custom("GmarketSansLight", size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                            .padding(.vertical, 10)
                        
                        // 내용
                        Text(notice.content)
                            .font(.custom("GmarketSansLight", size: 16))
                            .foregroundColor(Color.primary)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NoticeDetailView(notice: Notice(
        title: "[공지] FRENTE 앱 출시 안내",
        content: "안녕하세요, FRENTE입니다.\n\n수원 삼성 블루윙즈 팬들을 위한 중고거래 플랫폼 FRENTE가 출시되었습니다.\n\n앞으로 많은 관심과 사랑 부탁드립니다.",
        date: "2025.06.05",
        isImportant: true
    ))
} 