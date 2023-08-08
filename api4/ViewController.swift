//
//  ViewController.swift
//  api4
//
//  Created by vivek katariya on 06/08/23.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    var arrdata : Welcome?
    override func viewDidLoad() {
        super.viewDidLoad()
        apiData()
    }
    
    func apiData(){ AF.request("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d362e37d62fb4d69b4e85609a1e7c145", method: .get).responseData {responce in
        debugPrint(responce)
        guard let apiData =  responce.data else { return }
        do {
            self.arrdata = try  JSONDecoder().decode(Welcome.self, from: apiData)
            self.myTableView.reloadData()
            
        }
        catch{
            print(error.localizedDescription)
        }
    }
    }
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata?.articles.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! TableViewCell1
        cell.l1.text = arrdata?.articles[indexPath.row].title
        cell.l2.text = arrdata?.articles[indexPath.row].content
//        cell.img.image = img1(link: arrdata?.articles[indexPath.row].urlToImage ?? 0)
//
        cell.img.image = img1(link: (arrdata?.articles[indexPath.row].urlToImage)!)
       
        return cell
    }
    func img1(link: String) -> UIImage? {
        let url1 = URL(string: link)
        let data = try? Data(contentsOf: url1! as URL)
     
        return UIImage(data: data!)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigation(link: arrdata?.articles[indexPath.row].url ?? "")
        navigation(link: (arrdata?.articles[indexPath.row].url)!)
        print(arrdata?.articles[indexPath.row].url)
    }
    func navigation(link : String){
        let a = storyboard?.instantiateViewController(withIdentifier: "ViewController2")as!
        ViewController2
        a.web = link
        navigationController?.pushViewController(a, animated: true)
    }
    }
   
    

