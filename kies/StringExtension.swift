/*
 Copyright (c) 2016 Matthijs Hollemans and contributors
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import Foundation

extension String {
    public func longestCommonSubsequence(_ other: String) -> String {
        
        // Computes the length of the lcs using dynamic programming.
        // Output is a matrix of size (n+1)x(m+1), where matrix[x][y] is the length
        // of lcs between substring (0, x-1) of self and substring (0, y-1) of other.
        func lcsLength(_ other: String) -> [[Int]] {
            
            // Create matrix of size (n+1)x(m+1). The algorithm needs first row and
            // first column to be filled with 0.
            var matrix = [[Int]](repeating: [Int](repeating: 0, count: other.count+1), count: self.count+1)
            
            for (i, selfChar) in self.enumerated() {
                for (j, otherChar) in other.enumerated() {
                    if otherChar == selfChar {
                        // Common char found, add 1 to highest lcs found so far.
                        matrix[i+1][j+1] = matrix[i][j] + 1
                    } else {
                        // Not a match, propagates highest lcs length found so far.
                        matrix[i+1][j+1] = max(matrix[i][j+1], matrix[i+1][j])
                    }
                }
            }
            
            // Due to propagation, lcs length is at matrix[n][m].
            return matrix
        }
        
        // Backtracks from matrix[n][m] to matrix[1][1] looking for chars that are
        // common to both strings.
        func backtrack(_ matrix: [[Int]]) -> String {
            var i = self.count
            var j = other.count
            
            // charInSequence is in sync with i so we can get self[i]
            var charInSequence = self.endIndex
            
            var lcs = String()
            
            while i >= 1 && j >= 1 {
                // Indicates propagation without change: no new char was added to lcs.
                if matrix[i][j] == matrix[i][j - 1] {
                    j -= 1
                }
                    // Indicates propagation without change: no new char was added to lcs.
                else if matrix[i][j] == matrix[i - 1][j] {
                    i -= 1
                    // As i was decremented, move back charInSequence.
                    charInSequence = self.index(before: charInSequence)
                }
                    // Value on the left and above are different than current cell.
                    // This means 1 was added to lcs length (line 17).
                else {
                    i -= 1
                    j -= 1
                    charInSequence = self.index(before: charInSequence)
                    
                    lcs.append(self[charInSequence])
                }
            }
            
            // Due to backtrack, chars were added in reverse order: reverse it back.
            // Append and reverse is faster than inserting at index 0.
            return String(lcs.reversed())
        }
        
        // Combine dynamic programming approach with backtrack to find the lcs.
        return backtrack(lcsLength(other))
    }
}
