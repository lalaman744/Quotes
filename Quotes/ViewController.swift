import UIKit

class ViewController: UIViewController, QuoteDelegate {
    
   
    @IBOutlet var newQuoteButton: UIButton!
    @IBOutlet var quoteTextView: UITextView!
     let quoteFetcher = QuoteFetcher()
    
    func quoteFetched(quote: Quote) {
        DispatchQueue.main.async {
            
            
            let quoteText = "<p>\(quote.text)<p><em>\(quote.author)</em></p>"
            let data = Data(quoteText.utf8) //decodes &qt; and similar
            
            let attributedString = try? NSAttributedString(
                data: data,
                options:
                [.documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue ],
                documentAttributes: nil)
            
            self.quoteTextView.attributedText = attributedString
            self.newQuoteButton.isEnabled = true
        }
        
    }
    
    func quoteFetchError(because quoteError: QuoteError) {
        let alert = UIAlertController(title: "Error", message: "Error fetching quote. \(quoteError.message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
        newQuoteButton.isEnabled = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newQuoteButton.setTitle("Fetching...", for: .disabled)
        newQuoteButton.isEnabled = false

        quoteFetcher.quoteDelegate = self
        quoteFetcher.fetchRandomQuote()
    }
    
    
    @IBAction func getNewQuote(_ sender: Any) {
        newQuoteButton.isEnabled = false
        quoteFetcher.fetchRandomQuote()
        
    }
    
}

