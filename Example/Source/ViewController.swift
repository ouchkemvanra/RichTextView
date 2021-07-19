//
//  ViewController.swift
//  RichTextView-Example
//
//  Created by Ahmed Elkady on 2018-11-08.
//  Copyright © 2018 Top Hat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var scrollView: UIScrollView!

    // MARK: - Constants

    private enum Text {
        static let tableHTML = """
        <html>
            <head>
                <style>
                    table { width: 60%; text-align: center }
                    th { height: 100%; background-color: green }
                    td { height: 100%; background-color: lightblue }
                </style>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th scope="col"><p>1</p></th>
                            <th scope="col"><p>2</p></th>
                            <th scope="col"><p>3</p></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><p>4</p></td>
                            <td><p>5</p></td>
                            <td><p>6</p></td>
                        </tr>
                        <tr>
                            <td><p>7</p></td>
                            <td><p>8</p></td>
                            <td><p>9</p></td>
                        </tr>
                        <tr>
                            <td><p>10</p></td>
                            <td><p>11</p></td>
                            <td><p>12</p></td>
                        </tr>
                        <tr>
                            <td><p>13</p></td>
                            <td><p>14</p></td>
                            <td><p>15</p></td>
                        </tr>
                        <tr>
                            <td><p>16</p></td>
                            <td><p>17</p></td>
                            <td><p>18</p></td>
                        </tr>
                        <tr>
                            <td><p>19</p></td>
                            <td><p>20</p></td>
                            <td><p>21</p></td>
                        </tr>
                        <tr>
                            <td><p>22</p></td>
                            <td><p>23</p></td>
                            <td><p>24</p></td>
                        </tr>
                        <tr>
                            <td><p>25</p></td>
                            <td><p>26</p></td>
                            <td><p>27</p></td>
                        </tr>
                        <tr>
                            <td><p>28</p></td>
                            <td><p>29</p></td>
                            <td><p>30</p></td>
                        </tr>
                        <tr>
                            <td><p>31</p></td>
                            <td><p>32</p></td>
                            <td><p>33</p></td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
        """
        static let bulletListHTMLWithInteractiveElements = """
        ceci est une formule [math]\\frac{1}{\\Delta G} = \\frac{1}{a\\Delta x} + \\frac{1}{b\\Delta x}[/math]
        """
    }

    private enum Views {
        static let subviews: [UIView] = [
            InputOutputModuleView(text: Text.bulletListHTMLWithInteractiveElements)
        ]
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
    }

    // MARK: - Private Helpers

    private func setupSubviews() {
        for (index, subview) in Views.subviews.enumerated() {
            self.scrollView.addSubview(subview)
            subview.snp.makeConstraints { make in
                if index == 0 {
                    make.top.equalTo(self.scrollView)
                } else {
                    make.top.equalTo(Views.subviews[index - 1].snp.bottom)
                }
                make.width.equalTo(self.scrollView)
                make.centerX.equalTo(self.scrollView)
                if index == Views.subviews.count - 1 {
                    make.bottom.equalTo(self.scrollView)
                }
            }
        }
    }
}
