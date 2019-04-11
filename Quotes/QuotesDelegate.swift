import Foundation


protocol QuoteDelegate {
    func quoteFetched(quote: Quote)
    func quoteFetchError(because quoteError: QuoteError)
}
