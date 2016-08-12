%hook IGInlineGalleryPHDataSource

+ (id)dataSourceWithItemsSinceDate:(NSDate *)date {
	
	NSTimeInterval interval = [[[NSDate alloc] init] timeIntervalSinceDate:date];
	long longInterval = (long)interval;
	
	if (longInterval == 86400) { // setting 24 hours limit is ordered
		date = [NSDate dateWithTimeIntervalSince1970:0];
	}
	
	return %orig(date);
}

%end;

%hook IGAlbumGalleryViewController

-(void)viewDidLoad {

	%orig;

	UILabel *titleLabel = MSHookIvar<UILabel *>(self, "_titleLabel");
	[titleLabel setText:@"Gallery"];

}

%end