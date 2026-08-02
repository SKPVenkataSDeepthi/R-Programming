video_stats <- read.delim("videos-stats.csv", sep=",", strip.white=T)
dim(video_stats)
str(video_stats)
summary(video_stats)
#### check for NAs
video_stats %>%
  summarise_all(~ sum(is.na(.)))
#### drop the NAs
video_stats <- video_stats %>%
  drop_na()
### Data Wrangling
video_stats <- video_stats %>%
  mutate(LikesPer1k = round(Likes/(Views/1000), 2),
         CommentsPer1k = round(Comments/(Views/1000), 2),
         TitleLen = nchar(Title))
video_stats <- video_stats %>%
  mutate(PubYear = as.factor(substr(Published.At,1,4)),
         Published.At = as.POSIXct(Published.At, format="%Y-%m-%d"))
### creating statistical plots(bar graph to examine how many videos there are for each year)
video_stats %>%
  ggplot(aes(x=PubYear)) +
  geom_bar(fill="#765add") +
  theme_minimal() +
  labs(title = "Number of videos by year", x = "Publication Year", y = "Count")
### create a histogram for title length
video_stats %>%
  ggplot(aes(x = TitleLen)) +
  geom_histogram(binwidth = 5, fill = "#765add", color = "white") +
  theme_minimal() +
  labs(
    title = "Distribution of YouTube Video Title Length",
    x = "Title Length (characters)",
    y = "Number of Videos"
  )
# Create interactive plots (a line graph to see if certain keywords(categories) have gained more attention over the years, as measured by the total number of comments.)
plot1 <- video_stats %>%
  # get the total comments per keyword per year; divide by 1000 to change scale
  group_by(PubYear, Keyword) %>%
  summarize(total_comments = sum(Comments)/1000) %>%
  # create a ggplot colored by keywords
  ggplot(aes(x=PubYear, y=total_comments, color=Keyword))+
  # group = 1 specifies we want 1 line per keyword
  geom_line(aes(group=1)) +
  geom_point(size=0.5,alpha=0.5) +
  ylab("Comment Count") +
  xlab("Published Year") +
  labs(title="Total Comments by Category Overtime (by 1k)")+
  theme_minimal()
# convert it into a plotly graph
ggplotly(plot1)
### Is there a trend of creating shorter titles for all content overtime? Create an interactive line graph to find out
# Calculate the average title length for each year
plot2 <- video_stats %>%
  group_by(PubYear) %>%
  summarize(avg_title_length = mean(TitleLen)) %>%
  ggplot(aes(x = PubYear,
             y = avg_title_length,
             group = 1)) +
  geom_line(color = "#765add", linewidth = 1) +
  geom_point(color = "#765add", size = 2) +
  theme_minimal() +
  labs(
    title = "Average YouTube Title Length Over Time",
    x = "Publication Year",
    y = "Average Title Length (Characters)"
  )

# Convert to an interactive Plotly graph
ggplotly(plot2)
### Anlayse the same by category keyword
plot2 <- video_stats %>%
  group_by(PubYear, Keyword) %>%
  summarize(avg_title_length = mean(TitleLen), .groups = "drop") %>%
  ggplot(aes(x = PubYear,
             y = avg_title_length,
             color = Keyword,
             group = Keyword)) +
  geom_line() +
  geom_point(size = 1) +
  theme_minimal() +
  labs(
    title = "Average Title Length by Category Over Time",
    x = "Publication Year",
    y = "Average Title Length"
  )

ggplotly(plot2)
## Customizing popups (a scatter plot to observe if there's an absolute positive correlation between likes and comments for each keyword)
video_stats %>%
  # Specify variables we want to include
  plot_ly(x=~LikesPer1k, y=~CommentsPer1k, color=~Keyword, type="scatter", mode="markers",
          size=~Views, sizes=c(5,70),
          # Add markers for each point and specify information to display on hover
          marker=list(sizemode="diameter", opacity=0.5), hoverinfo="text",
          # Customize hover text
          text=~paste(
            paste0("Likes per 1k views: ", LikesPer1k),
            paste0("Comments per 1k views: ", CommentsPer1k),
            paste0("Views (100k): ", round(Views/100000, 2)),
            paste0("Keyword (Category): ", Keyword),
            sep="<br>")) %>%
  # Label the axes
  layout(title = 'Likes VS Comments per 1k Views',
         xaxis = list(title = 'Likes per 1k'),
         yaxis = list(title = 'Comments per 1k'),
         legend = list(title=list(text='<b> Keyword </b>')))
### converting these to a dashbabord
# Install the library
install.packages("flexdashboard")
### correlation or heartmap
library(corrplot)

corrplot(
  cor(video_stats[, c("Views","Likes","Comments","LikesPer1k","CommentsPer1k","TitleLen")]),
  method = "color"
)
### Boxplot of Title Length by Category
video_stats %>%
  ggplot(aes(
    x = Keyword,
    y = TitleLen,
    fill = Keyword
  )) +
  geom_boxplot(show.legend = FALSE) +
  coord_flip() +
  theme_minimal() +
  labs(
    title = "Title Length by Category",
    x = "Category",
    y = "Title Length"
  )
## top 10 categories by total views
video_stats %>%
  group_by(Keyword) %>%
  summarize(TotalViews = sum(Views)/1000000,
            .groups = "drop") %>%
  arrange(desc(TotalViews)) %>%
  ggplot(aes(x = reorder(Keyword, TotalViews),
             y = TotalViews)) +
  geom_col(fill = "#765add") +
  coord_flip() +
  theme_minimal() +
  labs(
    title = "Total Views by Category",
    x = "Category",
    y = "Views (Millions)"
  )
install.packages("ggradar")
install.packages("fmsb")
library(fmsb)
### RADAR CHART (Compare Categories)
library(dplyr)
library(fmsb)

radar_data <- video_stats %>%
  group_by(Keyword) %>%
  summarise(
    Views = mean(Views),
    Likes = mean(Likes),
    Comments = mean(Comments),
    LikesPer1k = mean(LikesPer1k),
    CommentsPer1k = mean(CommentsPer1k)
  )

rownames(radar_data) <- radar_data$Keyword
radar_data$Keyword <- NULL

# Normalize
radar_data <- as.data.frame(scale(radar_data))

radar_data <- rbind(
  rep(2, ncol(radar_data)),
  rep(-2, ncol(radar_data)),
  radar_data
)

radarchart(
  radar_data,
  pcol = rainbow(nrow(radar_data)-2),
  pfcol = scales::alpha(rainbow(nrow(radar_data)-2),0.2),
  plwd = 2
)

install.packages("ggridges")
### Ridgeline plot
library(ggridges)

ggplot(video_stats,
       aes(
         x=TitleLen,
         y=PubYear,
         fill=PubYear
       ))+
  geom_density_ridges()+
  theme_ridges()
install.packages("treemapify")
### treemap 
library(treemapify)

tree <- video_stats %>%
  group_by(Keyword) %>%
  summarise(Views=sum(Views))

ggplot(
  tree,
  aes(
    area=Views,
    fill=Keyword,
    label=Keyword
  )
)+
  geom_treemap()+
  geom_treemap_text(colour="white")