# Lifeboard
Native iOS Keyboard to catalog emergency information


The main inspiration for this application was the native iOS keyboard Drizzy.

When you go into the App Store and look through the new custom native keyboards available for download since the last WWDC, you see a multitude of comedic uses of the technology ranging anywhere from meme boards to boards that paste song lyrics. Nothing effectively useful has been achieved yet, until now... Lifeboard was created for social change. To change how people interact and have conversations. It opens as a gateway to help the common individual be able to approach situations they may not normally know exactly how to deal with. Those in tech industry might seem like they've got it made, but long hours, isolation, and stress put them at risk of mental illness. The most direct way to help individuals affected by depression is to lead the conversation. Lifeboard lets you do that without even leaving your conversation. Instantly have replies ready to either aid individuals or send distress messages right through any messages service or application. This keyboard works natively in all iOS applications and provides an instant select to input for quick response time.

This keyboard was first designed in Swift, but then redesigned in Objective-C half way through the hackathon. This is also my first time doing any iOS development so I learned both Swift and Objective-C development this weekend. This methodology below was the most critical in establishing as many categories as needed for responses:

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return self.menu[self.segmentedControl.selectedSegmentIndex];
}

Lifeboard is only at it's beginning stages and I plan to build it out to become an all purpose system for quick tools in messaging and references for everyday life whether it be distress or convenience tools.
